--CreateSudokuFunctions_PJR

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sfnFindPossibles]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
Begin
	DROP FUNCTION [dbo].[sfnFindPossibles]
End
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sfnRemoveExtraneousChars]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
Begin
	DROP FUNCTION [dbo].[sfnRemoveExtraneousChars]
End
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sfnValidateSudokuSet]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
Begin
	DROP FUNCTION [dbo].[sfnValidateSudokuSet]
End
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pete Revell
-- Create date: 25th Jan 2019
-- Description:	Finds any numbers missing from three sets (ByBlock, ByRow and ByColumn)
-- =============================================
Create Function [dbo].[sfnFindPossibles] (@strBlock As nVarChar(9), @strRow As nVarChar(9), @strColumn As nVarChar(9))
Returns nVarChar(9)
As
Begin
	Declare @strPossibles As nVarChar(9) = ''
			, @tiLoopCounter As TinyInt = 1

	While @tiLoopCounter <=9
	Begin
		If CharIndex(Cast(@tiLoopCounter as nVarChar(1)), @strBlock + @strRow + @strColumn) = 0
		Begin
			Set @strPossibles = @strPossibles + Cast(@tiLoopCounter as nVarChar(1))
		End
		Set @tiLoopCounter = @tiLoopCounter + 1 
	End
	Return @strPossibles
End
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pete Revell
-- Create date: 25th Jan 2019
-- Description:	Removes characters from within a string
-- =============================================
Create Function [dbo].[sfnRemoveExtraneousChars] (@strPossibles As nVarChar(9), @siNoLongerPossible As TinyInt)
Returns nVarChar(9)
As
Begin
	Declare @strPossiblesV2 As nVarChar(9) = (Case CharIndex(Cast(@siNoLongerPossible As nVarChar(1)), @strPossibles, 1) 
													When 1 Then Right(@strPossibles, Len(@strPossibles) -1)
													When Len(@strPossibles) Then Left(@strPossibles, Len(@strPossibles) -1)
													Else Left(@strPossibles, CharIndex(Cast(@siNoLongerPossible As nVarChar(1)), @strPossibles, 1) - 1) + Right(@strPossibles, Len(@strPossibles) - CharIndex(Cast(@siNoLongerPossible As nVarChar(1)), @strPossibles, 1)) 
												End)
	Return @strPossiblesV2
End
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pete Revell
-- Create date: 25th Jan 2019
-- Description:	Validates sets of 9 Numbers, ensuring no duplicates
-- =============================================
CREATE Function [dbo].[sfnValidateSudokuSet] (@strSudokuSet As nVarChar(9)) 
Returns TinyInt
As
Begin
	Declare @tiIsValid		As TinyInt = 1
			, @tiLoopCounter As TinyInt = 1
			, @tiTemp		As TinyInt
			, @tiTemp2		As TinyInt
	
	While @tiLoopCounter <=9
	Begin
		Set @tiTemp = CharIndex(Cast(@tiLoopCounter as nVarChar(1)), @strSudokuSet)
		If @tiTemp > 0
		Begin 
			Set @tiTemp2 = CharIndex(Cast(@tiLoopCounter as nVarChar(1)), @strSudokuSet, @tiTemp + (Case When @tiTemp = 9 Then 0 Else 1 End))
			If @tiTemp2 > @tiTemp
			Begin 
				Set @tiIsValid = 0
			End 
		End
		Set @tiLoopCounter = @tiLoopCounter + 1 
	End
	Return @tiIsValid
End
GO
