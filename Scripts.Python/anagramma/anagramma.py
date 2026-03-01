import random
import string
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation, PillowWriter

# =========================
# Parametri principali
# =========================
FRASE_INIZIALE = "SCHOOL MASTER"
FRASE_FINALE   = "THE CLASSROOM"

# Impostazioni animazione
FPS = 20
HOLD_INIZIO = 10     # frame di pausa su frase iniziale
HOLD_FINE   = 10     # frame di pausa su frase finale
DURATA_SCRAMBLE_SEC = 4  # usato solo se NON è un anagramma perfetto
SEME_RANDOM = 42     # fissare per riproducibilità; mettere None per casuale

# Aspetto
COLORE_TESTO = "#FFFFFF"
COLORE_BG = "#111111"
FONTE = "monospace"  # font generico monospace per evitare dipendenze di sistema
DIM_FIG = (12, 2.2)  # dimensioni figura in pollici
DIM_FONT = 32        # dimensione font

if SEME_RANDOM is not None:
    random.seed(SEME_RANDOM)
    np.random.seed(SEME_RANDOM)

def normalizza(s):
    """Porta in UPPERCASE. Manteniamo spazi e punteggiatura per visualizzare tutto."""
    return s.upper()

def sono_anagrammi(a, b):
    """Verifica se a e b hanno esattamente le stesse occorrenze di caratteri (spazi inclusi)."""
    from collections import Counter
    return Counter(a) == Counter(b)

def permutazione_da_a_b(a, b):
    """
    Crea una mappatura di occorrenze: per ogni posizione di b, individua
    quale indice di a (stessa lettera e occorrenza) deve finire lì.
    Ritorna:
        - tgt_order_indices: lista di "indici di a" nell'ordine richiesto per ottenere b
        - steps: lista di stringhe (ogni stringa è uno stato intermedio tramite swap) da a -> b
    """
    assert len(a) == len(b)
    from collections import defaultdict, deque

    # code per lettera a -> code posizioni di 'a' in a
    pos_in_a = defaultdict(deque)
    for i, ch in enumerate(a):
        pos_in_a[ch].append(i)

    # Per ogni posizione j in b, quale indice di a deve andarci?
    tgt_order_indices = []
    for j, ch in enumerate(b):
        if not pos_in_a[ch]:
            raise ValueError("Le frasi non sono anagrammi o i conteggi non corrispondono.")
        tgt_order_indices.append(pos_in_a[ch].popleft())

    # Ora costruiamo gli step:
    # order rappresenta, in ogni posizione i, quale indice di 'a' è attualmente lì
    order = list(range(len(a)))
    # mappa inversa: per ogni indice di 'a', in che posizione si trova ora
    pos_of = {idx: idx for idx in range(len(a))}

    steps = [a]  # primo stato: la stringa iniziale
    a_chars = list(a)

    def string_from_order(order_list):
        return "".join(a_chars[idx] for idx in order_list)

    # Trasformiamo order -> tgt_order_indices tramite swap semplici
    for i in range(len(a)):
        correct_source_idx = tgt_order_indices[i]
        if order[i] == correct_source_idx:
            continue
        # trova dove si trova adesso il "pezzo" che deve stare in i
        j = pos_of[correct_source_idx]
        # esegui lo swap nella rappresentazione 'order'
        order[i], order[j] = order[j], order[i]
        # aggiorna posizioni inverse
        pos_of[order[i]] = i
        pos_of[order[j]] = j
        # registra lo stato attuale
        steps.append(string_from_order(order))

    return tgt_order_indices, steps

def crea_frames_scramble(a, b, fps=20, hold_start=10, hold_end=10, durata_sec=4):
    """
    Genera gli stati testuali per una transizione scramble da a -> b.
    Alcuni frame di hold su a, poi morph, poi hold su b.
    """
    a = list(a)
    b = list(b)
    n = max(len(a), len(b))
    # Padding con spazi per uguagliare la lunghezza
    if len(a) < n: a += [" "] * (n - len(a))
    if len(b) < n: b += [" "] * (n - len(b))

    total_morph_frames = int(durata_sec * fps)
    indices = list(range(n))
    random.shuffle(indices)  # ordine casuale di rivelazione

    frames = []
    # Hold su A
    for _ in range(hold_start):
        frames.append("".join(a))

    # Morph: progressivamente riveliamo b
    charset = list(string.ascii_uppercase + ".,!?;:")  # set di "rumore"
    for t in range(total_morph_frames):
        k = int((t + 1) / total_morph_frames * n)
        revealed = set(indices[:k])
        cur = []
        for i in range(n):
            if b[i] == " ":  # preserviamo lo spazio
                cur.append(" ")
            elif i in revealed:
                cur.append(b[i])
            else:
                cur.append(random.choice(charset))
        frames.append("".join(cur))

    # Hold su B
    for _ in range(hold_end):
        frames.append("".join(b))

    return frames

def crea_frames_permuta(a, b, fps=20, hold_start=10, hold_end=10):
    """
    Genera gli stati testuali per una transizione 'anagramma' vera e propria (solo swap di caratteri).
    Tiene alcuni frame all'inizio e alla fine.
    """
    _, steps = permutazione_da_a_b(a, b)
    frames = []
    # hold su a
    for _ in range(hold_start):
        frames.append(steps[0])
    # tutti gli step
    frames.extend(steps[1:])  # il primo è già incluso nell'hold
    # hold su b
    for _ in range(hold_end):
        frames.append(steps[-1])
    return frames

# =========================
# Preparazione input
# =========================
A = normalizza(FRASE_INIZIALE)
B = normalizza(FRASE_FINALE)

# Uniformiamo le lunghezze con spazi a destra, per una resa più stabile
L = max(len(A), len(B))
A = A.ljust(L)
B = B.ljust(L)

# Scegliamo la modalità
usa_permuta = sono_anagrammi(A, B)
print(f"Modalità: {'PERMUTA (anagramma)' if usa_permuta else 'SCRAMBLE (morph)'}")

if usa_permuta:
    frames = crea_frames_permuta(A, B, fps=FPS, hold_start=HOLD_INIZIO, hold_end=HOLD_FINE)
else:
    frames = crea_frames_scramble(A, B, fps=FPS, hold_start=HOLD_INIZIO, hold_end=HOLD_FINE, durata_sec=DURATA_SCRAMBLE_SEC)

# =========================
# Rendering animazione
# =========================
fig, ax = plt.subplots(figsize=DIM_FIG)
fig.patch.set_facecolor(COLORE_BG)
ax.set_facecolor(COLORE_BG)
ax.axis("off")

text_artist = ax.text(
    0.5, 0.5, frames[0],
    color=COLORE_TESTO,
    ha="center", va="center",
    fontsize=DIM_FONT,
    fontfamily=FONTE
)

def init():
    text_artist.set_text(frames[0])
    return (text_artist,)

def update(frame_idx):
    text_artist.set_text(frames[frame_idx])
    return (text_artist,)

anim = FuncAnimation(
    fig, update,
    init_func=init,
    frames=len(frames),
    interval=1000 / FPS,
    blit=True
)

# Salvataggio come GIF (no ffmpeg richiesto)
output_name = "anagramma.gif"
writer = PillowWriter(fps=FPS)
anim.save(output_name, writer=writer)
print(f"GIF salvata come: {output_name}")

plt.show()
