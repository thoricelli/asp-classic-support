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

Class HttpRequest

  ''' <summary>Specifies the function to be called, when the readyState property is changed</summary>
  Public OnReadyStateChange

  ''' <summary>	Reports the status of the request</summary>
  Public ReadyState

  ''' <summary>Represents the message body as a byte array.</summary>
  Public ResponseBody

  ''' <summary>Represents the message body as IStream.</summary>
  Public ResponseStream

  ''' <summary>Represents the message body as text.</summary>
  Public ResponseText

  ''' <summary>Returns the HTTP request status code of the request.</summary>
  Public Status

  ''' <summary>Terminates and closes the HttpRequest object</summary>
  Function Abort()
  End Function

  ''' <summary>Reads the values of all the HTTP request headers</summary>
  Function GetAllResponseHeaders()
  End Function
  
  ''' <summary>Returns information about the requested transmission property</summary>
  Function GetOption()
  End Function

  ''' <summary>Retrieves the value of a specific HTTP request header</summary>
  Function GetResponseHeader()
  End Function

  ''' <summary>Sets the method, URL address and authentication information for the requested data transfer</summary>
  ''' <param name="Method">Data transfer method (POST, GET, PUT, ...)</param>
  ''' <param name="Url">Data source valid URL address</param>
  ''' <param name="Async">Data transfer type asynchronous/synchronous (true = asynchronous)</param>
  ''' <param name="User">Authentication by name</param>
  ''' <param name="Password">Authentication by password</param>
  Function Open(Method, Url, Async, User, Password)
  End Function

  ''' <summary>Sends an HTTP request to the server.</summary>
  ''' <param name="VarBody">Sent data in case of using POST method in the open method.</param>
  Function Send(VarBody)
  End Function

  ''' <summary>Sets the requested transmission property</summary>
  ''' <param name="NOption">Options available for the setOption method.</param>
  ''' <param name="VVal">The value of the desired setting</param>
  Function SetOption(NOption, VVal)
  End Function

  ''' <summary>	Specifies proxy settings</summary>
  ''' <param name="ProxySetting"></param>
  ''' <param name="VarProxyServer"></param>
  ''' <param name="VarBypassList"></param>
  Function SetProxy(ProxySetting, VarProxyServer, VarBypassList)
  End Function

  ''' <summary>Specify proxy authentication credentials.</summary>
  ''' <param name="Username">The user name to be authenticated.</param>
  ''' <param name="Password">The password for the user to be authenticated.</param>
  Function SetProxyCredentials(Username, Password)
  End Function

  ''' <summary>Retrieves the value of a specific HTTP request header.</summary>
  ''' <param name="SHeader">Header name (for example: "Content-Type").</param>
  ''' <param name="SValue">Header value (for example: "text/xml; charset=utf-8").</param>
  Function SetRequestHeader(SHeader, SValue)
  End Function

  ''' <summary>Specifies timeout settings for resolving the domain name, establishing the connection to the server, sending the data, and receiving the response.</summary>
  ''' <param name="ResolveTimout">The value is applied to mapping host names (for example "www.microsoft.com") to IP addresses</param>
  ''' <param name="ConnectTimeout">The value is applied to establishing a communication socket with the target server. The default value is 60 seconds.</param>
  ''' <param name="SendTimeout">The value applies to sending an individual packet of the request data (if any) on the communication socket to the target server. </param>
  ''' <param name="ReceiveTimeout">The value applies to receive a packet of response data from the target server.</param>
  Function SetTimeouts(ResolveTimout, ConnectTimeout, SendTimeout, ReceiveTimeout)
  End Function

  ''' <summary>Allows to suspend execution the requesting server while waiting for an asynchronous send operation to complete.</summary>
  ''' <param name="TimeoutInSeconds">Specifies the number seconds to wait for an asynchronous send operation to complete.</param>
  Function WaitForResponse(TimeoutInSeconds)
  End Function
End Class

Class Stream
  ''' <summary>Sets or returns a value that specifies into which character set the contents are to be translated. This property is only used with text Stream objects (type is adTypeText)</summary>
  Public CharSet
  ''' <summary>Returns whether the current position is at the end of the stream or not</summary>
  Public EOS
  ''' <summary>Sets or returns the line separator character used in a text Stream object</summary>
  Public LineSeperator
  ''' <summary> Sets or returns the available permissions for modifying data</summary>
  Public Mode
  ''' <summary>Sets or returns the current position (in bytes) from the beginning of a Stream object</summary>
  Public Position
  ''' <summary>Returns the size of an open Stream object</summary>
  Public Size
  ''' <summary>Returns a value describing if the Stream object is open or closed</summary>
  Public State
  ''' <summary>Sets or returns the type of data in a Stream object</summary>
  Public Type

  ''' <summary>Cancels an execution of an Open call on a Stream object</summary>
  Public Function Cancel()
  End Function

  ''' <summary>Closes a Stream object</summary>
  Public Function Close()
  End Function

  ''' <summary>Copies a specified number of characters/bytes from one Stream object into another Stream object</summary>
  ''' <param name="Dest">Required. Where to copy the Stream (contains a reference to an open Stream object) </param>
  ''' <param name="NumChars">Optional. An integer that specifies the number of characters or bytes to be copied from the current position in the source Stream to the destination Stream. Default is -1 (will copy all data from the current position to EOS)</param>
  Public Function CopyTo(Dest, NumChars)
  End Function

  ''' <summary>Sends the contents of the Stream buffer to the associated underlying object</summary>
  Public Function Flush()
  End Function

  ''' <summary>Loads the contents of a file into a Stream object</summary>
  ''' <param name="Filename"></param>
  Public Function LoadFromFile(Filename)
  End Function

  ''' <summary>The Open method is used to open a Stream object. </summary>
  ''' <param name="Source">Optional. The data source for the Stream object (a URL that points to an existing node in a tree structure, like an e-mail or file system or a reference to an already opened Record object). If source is not specified, a new Stream object, with a size of zero, will be created and opened</param>
  ''' <param name="Mode">Optional. A ConnectModeEnum value that specifies the access mode for a Stream object. Default is adModeUnknown </param>
  ''' <param name="Opt">Optional. A StreamOpenOptionsEnum value that specifies options for opening a Stream object. Default is adOpenStreamUnspecified </param>
  ''' <param name="Username">Optional. A name of a user who can access the Stream object. If Source is an already opened Record, this parameter is not specified </param>
  ''' <param name="Password">Optional. A password that validates the username. If Source is an already opened Record, this parameter is not specified </param>
  Public Function Open(Source, Mode, Opt, Username, Password)
  End Function

  ''' <summary>Reads the entire stream or a specified number of bytes from a binary Stream object</summary>
  ''' <param name="NumBytes">Optional. The number of bytes to read from the file, or a StreamReadEnum value. Default is adReadAll</param>
  Public Function Read(NumBytes)
  End Function

  ''' <summary>Reads the entire stream, a line, or a specified number of characters from a text Stream object</summary>
  ''' <param name="NumChars">Optional. The number of characters to read from the file, or a StreamReadEnum value. Default is adReadAll </param>
  Public Function ReadText(NumChars)
  End Function

  ''' <summary>Reads the entire stream, a line, or a specified number of characters from a text Stream object</summary>
  ''' <param name="FileName">Required. The name of the file to save the contents of the Stream object</param>
  ''' <param name="Option">Optional. A SaveOptionsEnum value that specifies whether a file should be created if it does not exist or overwritten. Default is adSaveCreateNotExist. </param>
  Public Function SaveToFile(FileName, Option)
  End Function

  ''' <summary>Sets the current position to be the end of the stream (EOS)</summary>
  Public Function SetEOS()
  End Function

  ''' <summary>Skips a line when reading a text Stream</summary>
  Public Function SkipLine()
  End Function

  ''' <summary>The Write method is used to write binary data to a binary Stream object.</summary>
  ''' <param name="Buffer">Required. An array of bytes to be written to a binary Stream object </param>
  Public Function Write(Buffer)
  End Function

  ''' <summary>Writes character data to a text Stream object</summary>
  ''' <param name="Data">Required. The text to be written to a text Stream object </param>
  ''' <param name="Opt">Optional. A StreamWriteEnum value that specifies whether a line separator must be added to the text</param>
  Function WriteText(Data, Opt)
  End Function
End Class

Class Message
  ''' <summary>The Attachments property specifies the collection of attachments for this message. This property is read-only.</summary>
  Public Attachments
  ''' <summary>Indicates whether the TextBody of a message should automatically be generated from the contents of the HTMLBody property for a multipart/alternative message.</summary>
  Public AutoGenerateTextBody
  ''' <summary>The blind carbon copy (Bcc) recipients for this message.</summary>
  Public BCC
  ''' <summary>The IBodyPart interface on this object. This property is read-only.</summary>
  Public BodyPart
  ''' <summary>The informational carbon copy (Cc) recipients for this message.</summary>
  Public CC
  ''' <summary>The Configuration object for the message.</summary>
  Public Configuration
  ''' <summary>The IDataSource interface on this object. This property is read-only.</summary>
  Public DataSource
  ''' <summary>The Delivery Status Notification (DSN) options for the message.</summary>
  Public DSNOptions
  ''' <summary>The SMTP and Network News Transfer Protocol (NNTP) envelope fields of the message. This property is read-only.</summary>
  Public EnvelopeFields
  ''' <summary>The Fields collection for the object. This property is read-only.</summary>
  Public Fields
  ''' <summary>The newsgroups to which any responses to this message should be posted.</summary>
  Public FollowUpTo
  ''' <summary>The e-mail addresses of the principal author or authors of this message.</summary>
  Public From
  ''' <summary>The HTML representation of the message.</summary>
  Public HTMLBody
  ''' <summary>The BodyPart object containing the HTML representation of the message. This property is read-only.</summary>
  Public HTMLBodyPart
  ''' <summary>A list of keywords for this message.</summary>
  Public Keywords
  ''' <summary>Indicates whether a Mail Delivery Notification (MDN) report is requested for a message.</summary>
  Public MDNRequested
  ''' <summary>Indicates whether or not this message is to be formatted using the Multipurpose Internet Mail Extensions (MIME) formatting scheme.</summary>
  Public MimeFormatted
  ''' <summary>The newsgroup recipients for the message.</summary>
  Public Newsgroups
  ''' <summary>Contains a description of the organization to which the sender belongs.</summary>
  Public Organization
  ''' <summary>The date/time this message was delivered to the server. This property is read-only.</summary>
  Public ReceivedTime
  ''' <summary>The address to which replies should be sent.</summary>
  Public ReplyTo
  ''' <summary>The address of the user or agent that actually submits the message.</summary>
  Public Sender
  ''' <summary>The date/time this message was submitted to the server. This property is read-only.</summary>
  Public SentOn
  ''' <summary>The subject of the message.</summary>
  Public Subject
  ''' <summary>The plain text representation of the body of this message.</summary>
  Public TextBody
  ''' <summary>Returns a body part object containing the text content of this message. This property is read-only.</summary>
  Public TextBodyPart
  ''' <summary>Contains a list of principal (To) recipients for this message.</summary>
  Public To

  ''' <summary>Adds an attachment to this message.</summary>
  ''' <param name="Url">The full path and file name of the message to be attached to this message.</param>
  ''' <param name="UserName">An optional user name to use for authentication when retrieving the resource using HTTP. This name can be used to set the credentials for basic, NTLM, and Negotiate (Kerberos) authentication packages.</param>
  ''' <param name="Password">An optional password to use for authentication when retrieving the resource using HTTP. This password can be used to set the credentials for basic, NTLM, and Negotiate (Kerberos) authentication packages.</param>
  ''' <param name="PVal">Returned reference to an IBodyPart Interface.</param>
  Function AddAttachment(Url, UserName, Password, PVal)
  End Function

  ''' <summary>The AddRelatedBodyPart method adds a BodyPart object that is referenced by content in the HTML body of the message.</summary>
  ''' <param name="Url">The full path and file name of the resource to be associated with the new body part.</param>
  ''' <param name="Reference">The Content-ID or Content-Location header that a rendering client can use to reference the new body part.</param>
  ''' <param name="ReferenceType">The method of referencing the new body part. This parameter will determine which type of Content header is placed in this Multipurpose Internet Mail Extensions (MIME) subpart. The value is one of the CdoReferenceType Enum values.</param>
  ''' <param name="UserName">An optional user name to use for authentication when retrieving the resource using HTTP. This name can be used to set the credentials for basic, NTLM, and Negotiate (Kerberos) authentication packages.</param>
  ''' <param name="Password">An optional password to use for authentication when retrieving the resource using HTTP. This password can be used to set the credentials for basic, NTLM, and Negotiate (Kerberos) authentication packages.</param>
  ''' <param name="PVal">Returned reference to an IBodyPart Interface.</param>
  Function AddRelatedBodyPart(Url, Reference, ReferenceType, UserName, Password, PVal)
  End Function

  ''' <summary>The CreateMHTMLBody method converts the contents of an entire Web page into a MIME Encapsulation of Aggregate HTML Documents (MHTML) formatted message body.</summary>
  ''' <param name="Url">The full path and file name of the Web page.</param>
  ''' <param name="Flags">A bitmask of flags controlling inclusion of items from the Web page as related body parts. The flags are defined in the CdoMHTMLFlags Enum. The default value of Flags is CdoSuppressNone.</param>
  ''' <param name="UserName">An optional user name to use for authentication when retrieving the resource using HTTP. This name can be used to set the credentials for basic, NTLM, and Negotiate (Kerberos) authentication packages.</param>
  ''' <param name="Password">An optional password to use for authentication when retrieving the resource using HTTP. This password can be used to set the credentials for basic, NTLM, and Negotiate (Kerberos) authentication packages.</param>
  Function CreateMHTMLBody(Url, Flags, UserName, Password)
  End Function

  ''' <summary>The Forward method creates and returns another message that can be used to forward this message.</summary>
  ''' <param name="pVal">Returned reference to an IMessage Interface.</param>
  Function Forward(pVal)
  End Function

  ''' <summary>Returns the specified dual interface on the object.</summary>
  ''' <param name="Interface">The name of the interface to obtain.</param>
  ''' <param name="PVal">Returned reference to the IDispatch Interface of the object.</param>
  Function GetInterface(Interface, PVal)
  End Function

  ''' <summary>The GetStream method returns this message in serialized (wire-transport) format in a Microsoft ActiveX Data Objects (ADO) Stream object.</summary>
  ''' <param name="PVal">Returned reference to the _Stream Interface of the object.</param>
  Function GetStream(PVal)
  End Function

  ''' <summary>The Post method posts this message to the specified newsgroups.</summary>
  Function Post()
  End Function

  ''' <summary>The PostReply method creates and returns another message that can be used to post a reply to this message.</summary>
  ''' <param name="PVal">Returned reference to an IMessage Interface.</param>
  Function PostReply(PVal)
  End Function

  ''' <summary>The Reply method creates and returns another message that can be used to reply to the sender of this message.</summary>
  ''' <param name="PVal">Returned reference to an IMessage Interface.</param>
  Function Reply(PVal)
  End Function

  ''' <summary>The ReplyAll method creates and returns another message that can be used to reply to the sender and all recipients.</summary>
  ''' <param name="PVal">Returned reference to an IMessage Interface.</param>
  Function ReplyAll(PVal)
  End Function

  ''' <summary>The Send method sends the message.</summary>
  Function Send()
  End Function
End Class

Class Configuration

  ''' <summary>Returns the Fields object that contains the currently defined configuration settings. This property is read-only.</summary>
  Public Property Get Fields(Name)
  End Function

  ''' <summary></summary>
  ''' <param name="PVal">The name of the interface to obtain. The list of possible interfaces to return depends upon the Component Object Model (COM) class that provides the implementation.</param>
  Function GetInterface(PVal)
  End Function

  ''' <summary>Loads the specified configuration.</summary>
  ''' <param name="LoadFrom">Specifies what configuration to load. Can be any value from the following CdoConfigSource Enum.</param>
  ''' <param name="Url">This parameter is ignored and reserved for future use.</param>
  Function Load(LoadFrom, Url)
  End Function
End Class

%>