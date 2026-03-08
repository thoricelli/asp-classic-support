<%

Option Explicit

''' <summary>The ADO Connection Object is used to create an open connection to a data source. Through this connection, you can access and manipulate a database.</summary>
Class Connection

  ''' <summary>Begins a new transaction</summary>
  ''' <returns type="Integer">The nesting level of the transaction</returns>
  Function BeginTrans()
  End Function

  ''' <summary>Cancels an execution</summary>
  Function Cancel()
  End Function

  ''' <summary>Closes a connection</summary>
  Function Close()
  End Function

  ''' <summary>Saves any changes and ends the current transaction</summary>
  Function CommitTrans()
  End Function

  ''' <summary>Executes a query, statement, procedure or provider specific text</summary>
  ''' <param name="CommandText">Required. The SQL statement, stored procedure, or provider-specific text to execute</param>
  ''' <param name="Ra">Optional. The number of records affected by the query </param>
  ''' <param name="Options">Optional. Sets how the provider should evaluate the commandtext parameter. Can be one or more CommandTypeEnum or ExecuteOptionEnum values. Default is adCmdUnspecified </param>
  ''' <returns type="RecordSet">Returns a Recordset object reference</returns>
  Function Execute(CommandText, Ra, Options)
  End Function

  ''' <summary>Opens a connection</summary>
  ''' <param name="ConnectionString">Optional. A string value that contains information about the connection. The string is composed of a series of parameter=value statements separated by semicolons.</param>
  ''' <param name="UserID">Optional. A String value that contains a user name for the connection </param>
  ''' <param name="Password">Optional. A String value that contains a password for the connection </param>
  ''' <param name="Options">Optional. A ConnectOptionEnum value that determines whether this method should return after or before the connection is established. </param>
  Function Open(ConnectionString, UserID, Password, Options)
  End Function

  ''' <summary>Returns schema information from the provider about the data source</summary>
  ''' <param name="queryType">Required. A SchemaEnum value that represents the type of schema query to run</param>
  ''' <param name="Criteria">Optional. An array of query constraints for each querytype option, as listed in SchemaEnum</param>
  ''' <param name="SchemaId">The GUID for a provider-schema query not defined by the OLE DB specification. Required if querytype is set to adSchemaProviderSpecific </param>
  Function OpenSchema(queryType, Criteria, SchemaId)
  End Function

  ''' <summary>Cancels any changes in the current transaction and ends the transaction</summary>
  Function RollbackTrans()
  End Function

  ''' <summary>Sets or returns the attributes of a Connection object</summary>
  Property Get Attributes
  End Property

  ''' <summary>Sets or returns the number of seconds to wait while attempting to execute a command</summary>
  Property Get CommandTimeout
  End Property

  ''' <summary>Sets or returns the details used to create a connection to a data source</summary>
  Property Get ConnectionString
  End Property

  ''' <summary>Sets or returns the number of seconds to wait for a connection to open</summary>
  Property Get ConnectionTimeout
  End Property

  ''' <summary>Sets or returns the location of the cursor service</summary>
  Property Get CursorLocation
  End Property

  ''' <summary>Sets or returns the default database name</summary>
  Property Get DefaultDatabase
  End Property

  ''' <summary>Contains all the Error objects of the Connection object</summary>
  Property Get Errors
  End Property

  ''' <summary>Sets or returns the isolation level</summary>
  Property Get IsolationLevel
  End Property

  ''' <summary>Sets or returns the provider access permission</summary>
  Property Get Mode
  End Property

  ''' <summary>Contains all the Property objects of the Connection object</summary>
  Property Get Properties
  End Property

  ''' <summary>Sets or returns the provider name</summary>
  Property Get Provider
  End Property

  ''' <summary>Returns a value describing if the connection is open or closed</summary>
  Property Get State
  End Property

  ''' <summary>Returns the ADO version number</summary>
  Property Get Version
  End Property

End Class

''' <summary>The ADO Recordset object is used to hold a set of records from a database table. A Recordset object consist of records and columns (fields).</summary>
Class Recordset

  ''' <summary>Creates a new record</summary>
  ''' <param name="FieldList">Optional. A field name, or an array of field names, or the numeric position of the fields in the new record </param>
  ''' <param name="Values">Optional. A value, or an array of values for the fields in the new record</param>
  Function AddNew(FieldList, Values)
  End Function

  ''' <summary>Cancels an execution</summary>
  Function Cancel()
  End Function

  ''' <summary>Cancels a batch update</summary>
  ''' <param name="AffectRec">Optional. An AffectEnum value that indicates which records this method will affect</param>
  Function CancelBatch(AffectRec)
  End Function

  ''' <summary>Cancels changes made to a record of a Recordset object</summary>
  Function CancelUpdate()
  End Function

  ''' <summaryCreates a duplicate of an existing Recordset</summary>
  ''' <param name="LockType">Optional. A LockTypeEnum value that specifies the lock type</param>
  ''' <returns type="Recordset">The cloned recordset</returns>
  Function Clone(LockType)
  End Function

  ''' <summary>Closes a Recordset</summary>
  Function Close()
  End Function

  ''' <summary>Compares two bookmarks</summary>
  ''' <param name="Mark1">The bookmark of the first row</param>
  ''' <param name="Mark2">The bookmark of the second row</param>
  ''' <returns type="CompareEnum">
  Function CompareBookmarks(Mark1, Mark2)
  End Function

  ''' <summary>Deletes a record or a group of records</summary>
  ''' <param name="AffectRecords">An AffectEnum value that specifies which records this method will delete. Default is adAffectCurrent</param>
  Function Delete(AffectRecords)
  End Function

  ''' <summary>Searches for a record in a Recordset that satisfies a specified criteria</summary>
  ''' <param name="Criteria">Required. The column name, comparison operator, and value to use in the search. </param>
  ''' <param name="SkipRows">Optional. Specifies how many records beyond the current record to skip before beginning the search. Default is 0 </param>
  ''' <param name="Direction">Optional. A SearchDirectionEnum value that specifies the search direction</param>
  ''' <param name="Start">Optional. The starting position for the search</param>
  Function Find(Criteria, SkipRows, Direction, Start)
  End Function

  ''' <summary>Copies multiple records from a Recordset object into a two-dimensional array</summary>
  ''' <param name="Rows">Optional. A GetRowsOptionEnum value that specifies the number of records to retrieve. Default is adGetRowsRest.</param>
  ''' <param name="Start">Optional. What record to start on, a record number or a BookmarkEnum value</param>
  ''' <param name="Fields">Optional. If you want to specify only the fields that the GetRows call will return, it is possible to pass a single field name/number or an array of field names/numbers in this argument</param>
  ''' <summary type="Variant"></summary>
  Function GetRows(Rows, Start, Fields)
  End Function

  ''' <summary>Returns a Recordset as a string</summary>
  ''' <param name="Format">Optional. A StringFormatEnum value that specifies the format when retrieving a Recordset as a string </param>
  ''' <param name="N">Optional. The number of rows to be converted in the Recordset</param>
  ''' <param name="ColDel">Optional. If format is set to adClipString it is a column delimiter. Otherwise it is the tab character</param>
  ''' <param name="Rowdel">Optional. If format is set to adClipString it is a row delimiter. Otherwise it is the carriage return character </param>
  ''' <param name="NullExpr">Optional. If format is set to adClipString it is an expression used instead of a null value. Otherwise it is an empty string </param>
  ''' <returns type="String"></returns>
  Function GetString(Format, N, ColDel, Rowdel, NullExpr)
  End Function

  ''' <summary>Moves the record pointer in a Recordset object</summary>
  ''' <param name="NumRec">Required. Specifies how many records the record pointer will move.</param>
  ''' <param name="Start">Optional. Where to start. Can be a bookmark or a BookmarkEnum value</param>
  Function Move(NumRec, Start)
  End Function

  ''' <summary>Moves the record pointer to the first record</summary>
  Function MoveFirst()
  End Function

  ''' <summary>Moves the record pointer to the last record</summary>
  Function MoveLast()
  End Function

  ''' <summary>Moves the record pointer to the next record</summary>
  Function MoveNext()
  End Function

  ''' <summary>Moves the record pointer to the previous record</summary>
  Function MovePrevious()
  End Function

  ''' <summary>Clears the current Recordset object and returns the next Recordset object by looping through a series of commands</summary>
  ''' <param name="Ra">Optional. Returns the number of records affected by the operation </param>
  Function NextRecordset(Ra)
  End Function

  ''' <summary>Opens a database element that gives you access to records in a table, the results of a query, or to a saved Recordset</summary>
  ''' <param name="Source">Optional. Specifies a data source.  The source parameter may be one of the following: </param>
  ''' <param name="ActConn">Optional. A connection string or a Connection object </param>
  ''' <param name="CursorTyp">Optional. A CursorTypeEnum value that specifies the type of cursor to use when opening a Recordset object. Default is adOpenForwardOnly </param>
  ''' <param name="LockTyp">Optional. A LockTypeEnum value that specifies the type of locking on a Recordset object. Default is adLockReadOnly </param>
  ''' <param name="Opt">Optional. Specifies how to evaluate the source parameter if it is not a Command object. Can be one or more CommandTypeEnum or ExecuteOptionEnum values. </param>
  Function Open(Source, ActConn, CursorTyp, LockTyp, Opt)
  End Function

  ''' <summary>Updates the data in a Recordset by re-executing the query that made the original Recordset</summary>
  ''' <param name="options">Optional. Specifies how to execute this command. Can be an ExecuteOptionEnum value</param>
  Function Requery(options)
  End Function

  ''' <summary>Refreshes the data in the current Recordset from the original database</summary>
  ''' <param name="AffectRecords">Optional. An AffectEnum value that specifies which records this method will affect. Default is adAffectAll</param>
  ''' <param name="ResyncValues">Optional. A ResyncEnum value that specifies if underlying values are overwritten. Default is adResyncAllValues</param>
  Function Resync(AffectRecords, ResyncValues)
  End Function

  ''' <summary>Saves a Recordset object to a file or a Stream object</summary>
  ''' <param name="Destination">Optional. Specifies where to save the Recordset object; the path name of a file or a reference to a Stream object</param>
  ''' <param name="PresistFormat">Optional. A PersistFormatEnum value that specifies the format of the Recordset (XML or ADTG). Default is adPersistADTG</param>
  Function Save(Destination, PresistFormat)
  End Function

  ''' <summary>Searches the index of a Recordset to find a record that matches the specified values</summary>
  ''' <param name="KeyValues">Required. An array of values to compare with the values in each column </param>
  ''' <param name="SeekOption">Required. A SeekEnum value that specifies the type of seek</param>
  Function Seek(KeyValues, SeekOption)
  End Function

  ''' <summary>Returns a boolean value that defines whether or not a Recordset object supports a specific type of functionality</summary>
  ''' <param name="CursorOptions">Required. One or more CursorOptionEnum values that specifies what functionality this method should test for</param>
  Function Supports(CursorOptions)
  End Function

  ''' <summary>Saves all changes made to a single record in a Recordset object</summary>
  ''' <param name="Fields">Optional. A field name, or an array of field names or field positions to update</param>
  ''' <param name="Values">Optional. A value or an array of values for the field or array of fields you want to update</param>
  Function Update(Fields, Values)
  End Function

  ''' <summary>Saves all changes in a Recordset to the database. Used when working in batch update mode</summary>
  ''' <param name="AffectRecords">Optional. An AffectEnum value that specifies which records this method will affect. </param>
  Function UpdateBatch(AffectRecords)
  End Function
  
  Property Get Collect
  End Property

  ''' <summary>Sets or returns a value that specifies the page number in the Recordset object</summary>
  Property Get AbsolutePage
  End Property

  ''' <summary>Sets or returns a value that specifies the ordinal position of the current record in the Recordset object</summary>
  Property Get AbsolutePosition
  End Property

  ''' <summary>Returns the Command object associated with the Recordset</summary>
  Property Get ActiveCommand
  End Property

  ''' <summary>Sets or returns a definition for a connection if the connection is closed, or the current Connection object if the connection is open</summary>
  Property Get ActiveConnection
  End Property

  ''' <summary>Returns true if the current record position is before the first record, otherwise false</summary>
  Property Get BOF
  End Property

  ''' <summary>Sets or returns a bookmark. The bookmark saves the position of the current record</summary>
  Property Get Bookmark
  End Property

  ''' <summary>Sets or returns the number of records that can be cached</summary>
  Property Get CacheSize
  End Property

  ''' <summary>Sets or returns the location of the cursor service</summary>
  Property Get CursorLocation
  End Property

  ''' <summary>Sets or returns the cursor type of a Recordset object</summary>
  Property Get CursorType
  End Property

  ''' <summary>Sets or returns the name of the data member that will be retrieved from the object referenced by the DataSource property</summary>
  Property Get DataMember
  End Property

  ''' <summary>Specifies an object containing data to be represented as a Recordset object</summary>
  Property Get DataSource
  End Property

  ''' <summary>Returns the editing status of the current record</summary>
  Property Get EditMode
  End Property

  ''' <summary>Returns true if the current record position is after the last record, otherwise false</summary>
  Property Get EOF
  End Property

  ''' <summary>Indicates the number of Field objects in the Recordset object</summary>
  Property Get Fields
  End Property

  ''' <summary>Sets or returns a filter for the data in a Recordset object</summary>
  Property Get Filter
  End Property

  ''' <summary>Sets or returns the name of the current index for a Recordset object</summary>
  Property Get Index
  End Property

  ''' <summary>Sets or returns a value that specifies the type of locking when editing a record in a Recordset</summary>
  Property Get LockType
  End Property

  ''' <summary>Sets or returns a value that specifies which records are to be returned to the server</summary>
  Property Get MarshalOptions
  End Property

  ''' <summary>Sets or returns the maximum number of records to return to a Recordset object from a query</summary>
  Property Get MaxRecods
  End Property

  ''' <summary>Returns the number of pages with data in a Recordset object</summary>
  Property Get PageCount
  End Property

  ''' <summary>Sets or returns the maximum number of records allowed on a single page of a Recordset object</summary>
  Property Get PageSize
  End Property

  ''' <summary>Contains all the Property objects in the Recordset object</summary>
  Property Get Properties
  End Property

  ''' <summary>Returns the number of records in a Recordset object</summary>
  Property Get RecordCount
  End Property

  ''' <summary>Sets or returns the field names in the Recordset to sort on</summary>
  Property Get Sort
  End Property

  ''' <summary>Sets a string value or a Command object reference, or returns a String value that indicates the data source of the Recordset object</summary>
  Property Get Source
  End Property

  ''' <summary>Returns a value that describes if the Recordset object is open, closed, connecting, executing or retrieving data</summary>
  Property Get State
  End Property

  ''' <summary>Returns the status of the current record with regard to batch updates or other bulk operations</summary>
  Property Get Status
  End Property

  ''' <summary>Sets or returns whether the reference to the child records will change when the parent record position changes</summary>
  Property Get StayInSync
  End Property

End Class

Class Command

  ''' <summary>Cancels an execution of a method</summary>
  Function Cancel()
  End Function

  ''' <summary>Creates a new Parameter object</summary>
  ''' <param name="Name">Optional. The name of the Parameter object.</param>
  ''' <param name="Type">Optional. One of the DataTypeEnum constants that specifies the data type for the Parameter object.</param>
  ''' <param name="Direction">Optional. One of the ParameterDirectionEnum constants that defines the direction of the Parameter object.</param>
  ''' <param name="Size">Optional. Specifies the length of a variable-length data type, if such a type was declared in the Type parameter.</param>
  ''' <param name="Value">Optional. The value of the Parameter object</param>
  ''' <returns type="Parameter"></returns>
  Function CreateParameter(Name, Type, Direction, Size, Value)
  End Function

  ''' <summary>Executes the query, SQL statement or procedure in the CommandText property</summary>
  ''' <param name="Ra">Optional. Returns the number of records affected by a query. For a row-returning query, use the RecordCount property of the Recordset object to count of how many records are in the object.</param>
  ''' <param name="Parameters">Optional. Parameter values passed with an SQL statement. Used to change, update, or insert new parameter values into the Parameters Collection.</param>
  ''' <param name="Options">Optional. Sets how the provider should evaluate the CommandText property. Can be one or more CommandTypeEnum or ExecuteOptionEnum values.</param>
  ''' <returns type="Recordset"></returns>
  Function Execute(Ra, Parameters, Options)
  End Function

  ''' <summary>Sets or returns a definition for a connection if the connection is closed, or the current Connection object if the connection is open</summary>
  Property Get ActiveConnection
  End Property

  Property Get CommandStream
  End Property

  ''' <summary>Sets or returns a provider command</summary>
  Property Get CommandText
  End Property
  
  ''' <summary>Sets or returns the number of seconds to wait while attempting to execute a command</summary>
  Property Get CommandTimeout
  End Property
  
  ''' <summary>Sets or returns the type of a Command object</summary>
  Property Get CommandType
  End Property
  
  Property Get Dialect
  End Property
  
  ''' <summary>Sets or returns the name of a Command object</summary>
  Property Get Name
  End Property
  
  Property Get NamedParameters
  End Property
  
  ''' <summary>Contains all the Parameter objects of a Command Object</summary>
  Property Get Parameters
  End Property
  
  ''' <summary>Sets or returns a Boolean value that, if set to True, indicates that the command should save a prepared version of the query before the first execution</summary>
  Property Get Prepared
  End Property
  
  ''' <summary>Contains all the Property objects of a Command Object</summary>
  Property Get Properties
  End Property
  
  ''' <summary>Returns a value that describes if the Command object is open, closed, connecting, executing or retrieving data</summary>
  Property Get State
  End Property

End Class

%>