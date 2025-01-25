SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
 Test: exec di.updateGenerateBimlFlag @EnableSourceConnectionID = 7, @EnableDestinationConnectionID = 8, @EnableMasterDestinationConnectionID = 9
*/
Create Procedure [di].[updateGenerateBimlFlag]
  @EnableSourceConnectionID int
, @EnableDestinationConnectionID int
, @EnableMasterDestinationConnectionID int
As

 begin tran

    -- Configure Connections
	Update di.Connections
	Set GenerateBimlFlag = 0
	  , RefreshMetadata = 0
	Where ConnectionID Not In (@EnableSourceConnectionID, @EnableDestinationConnectionID, @EnableMasterDestinationConnectionID)

	Update di.Connections
	Set GenerateBimlFlag = 1
	  , RefreshMetadata = 1
	Where ConnectionID In (@EnableSourceConnectionID, @EnableDestinationConnectionID, @EnableMasterDestinationConnectionID)

   -- Configure Databases

	Update di.[Databases]
	Set GenerateBimlFlag = 0
	  , RefreshMetadata = 0
	Where ConnectionID Not In (@EnableSourceConnectionID, @EnableDestinationConnectionID)

	Update di.[Databases]
	Set GenerateBimlFlag = 1
	  , RefreshMetadata = 1
	Where ConnectionID In (@EnableSourceConnectionID, @EnableDestinationConnectionID)

	-- Configure Schemas

	Update di.[Schemas]
	Set GenerateBimlFlag = 0
	  , RefreshMetadata = 0
	Where DatabaseID In (Select DatabaseID
						 From di.[Databases]
						 Where ConnectionID Not In (@EnableSourceConnectionID, @EnableDestinationConnectionID))

	Update di.[Schemas]
	Set GenerateBimlFlag = 1
	  , RefreshMetadata = 1
	Where DatabaseID In (Select DatabaseID
						 From di.[Databases]
						 Where ConnectionID In (@EnableSourceConnectionID, @EnableDestinationConnectionID))

	-- Configure Tables

	Update di.[Tables]
	Set GenerateBimlFlag = 0
	  , RefreshMetadata = 0
	Where SchemaID In (Select SchemaID
					   From di.[Schemas]
					   Where DatabaseID In (Select DatabaseID
											From di.[Databases]
											Where ConnectionID Not In (@EnableSourceConnectionID, @EnableDestinationConnectionID)))

	Update di.[Tables]
	Set GenerateBimlFlag = 1
	  , RefreshMetadata = 1
	Where SchemaID In (Select SchemaID
					   From di.[Schemas]
					   Where DatabaseID In (Select DatabaseID
											From di.[Databases]
											Where ConnectionID In (@EnableSourceConnectionID, @EnableDestinationConnectionID)))

	-- Configure Columns

	Update di.[Columns]
	Set GenerateBimlFlag = 0
	  , RefreshMetadata = 0
	Where TableID In (Select TableID
					  From di.[Tables]
					  Where SchemaID In (Select SchemaID
										 From di.[Schemas]
										 Where DatabaseID In (Select DatabaseID
															  From di.[Databases]
															   Where ConnectionID Not In (@EnableSourceConnectionID, @EnableDestinationConnectionID))))

	Update di.[Columns]
	Set GenerateBimlFlag = 1
	  , RefreshMetadata = 1
	Where TableID In (Select TableID
					  From di.[Tables]
					  Where SchemaID In (Select SchemaID
										 From di.[Schemas]
										 Where DatabaseID In (Select DatabaseID
															  From di.[Databases]
															  Where ConnectionID In (@EnableSourceConnectionID, @EnableDestinationConnectionID))))
	commit


GO
