package com.junkbyte.console.core
{
   import flash.net.LocalConnection;
   import com.junkbyte.console.vos.Log;
   import flash.utils.ByteArray;
   import com.junkbyte.console.vos.GraphGroup;
   import flash.events.StatusEvent;
   import flash.events.AsyncErrorEvent;
   import flash.system.Security;
   import flash.events.SecurityErrorEvent;
   import com.junkbyte.console.Console;
   
   public class Remoting extends ConsoleCore
   {
      
      public static const NONE:uint = 0;
      
      public static const SENDER:uint = 1;
      
      public static const RECIEVER:uint = 2;
       
      
      private var _client:Object;
      
      private var _mode:uint;
      
      private var _connection:LocalConnection;
      
      private var _queue:Array;
      
      private var _lastLogin:String = "";
      
      private var _password:String;
      
      private var _loggedIn:Boolean;
      
      private var _canDraw:Boolean;
      
      private var _prevG:Boolean;
      
      private var _prevScope:String;
      
      public function Remoting(param1:Console, param2:String)
      {
         super(param1);
         this._password = param2;
         this._client = new Object();
         this._client.login = this.login;
         this._client.requestLogin = this.requestLogin;
         this._client.loginFail = this.loginFail;
         this._client.loginSuccess = this.loginSuccess;
         this._client.sync = this.remoteSync;
      }
      
      public function queueLog(param1:Log) : void
      {
         if(this._mode != SENDER || !this._loggedIn)
         {
            return;
         }
         this._queue.push(param1.toBytes());
         var _loc2_:int = config.maxLines;
         if(this._queue.length > _loc2_ && _loc2_ > 0)
         {
            this._queue.splice(0,1);
         }
      }
      
      public function update(param1:Array) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:ByteArray = null;
         var _loc6_:uint = 0;
         var _loc7_:ByteArray = null;
         var _loc8_:ByteArray = null;
         if(this._mode == SENDER)
         {
            if(!this._loggedIn)
            {
               return;
            }
            _loc2_ = new ByteArray();
            _loc4_ = param1.length;
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc2_.writeBytes(GraphGroup(param1[_loc6_]).toBytes());
               _loc6_++;
            }
            _loc3_ = _loc2_.length;
            _loc4_ = this._queue.length;
            _loc5_ = new ByteArray();
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc8_ = this._queue[_loc6_];
               _loc3_ = _loc3_ + _loc8_.length;
               if(_loc3_ <= 36000 || _loc6_ == 0)
               {
                  _loc5_.writeBytes(_loc8_);
                  _loc6_++;
                  continue;
               }
               break;
            }
            this._queue = this._queue.splice(_loc6_);
            _loc7_ = new ByteArray();
            _loc7_.writeObject(_loc5_);
            _loc7_.writeObject(_loc2_);
            _loc7_.writeUTF(console.cl.scopeString);
            if(_loc3_ > 0 || this._prevScope != console.cl.scopeString || this._prevG)
            {
               this._prevG = !!_loc2_.length?true:false;
               this._prevScope = console.cl.scopeString;
               this.send("sync",_loc7_);
            }
         }
         else if(!console.paused)
         {
            this._canDraw = true;
         }
      }
      
      private function remoteSync(param1:ByteArray) : void
      {
         var t:String = null;
         var c:String = null;
         var p:int = 0;
         var r:Boolean = false;
         var a:Array = null;
         var graphs:ByteArray = null;
         var bytes:ByteArray = param1;
         if(this.remoting != Remoting.RECIEVER || !bytes)
         {
            return;
         }
         bytes.position = 0;
         var logs:ByteArray = bytes.readObject();
         logs.position = 0;
         while(logs.bytesAvailable)
         {
            t = logs.readUTF();
            c = logs.readUTF();
            p = logs.readInt();
            r = logs.readBoolean();
            console.addLine(new Array(t),p,c,r,true);
         }
         try
         {
            a = [];
            graphs = bytes.readObject();
            graphs.position = 0;
            while(graphs.bytesAvailable)
            {
               a.push(GraphGroup.FromBytes(graphs));
            }
            console.panels.updateGraphs(a,this._canDraw);
            if(this._canDraw)
            {
               console.panels.mainPanel.updateCLScope(bytes.readUTF());
               this._canDraw = false;
            }
            return;
         }
         catch(e:Error)
         {
            report(e);
            return;
         }
      }
      
      public function send(param1:String, ... rest) : Boolean
      {
         var command:String = param1;
         var args:Array = rest;
         var target:String = config.remotingConnectionName + (this.remoting == Remoting.RECIEVER?SENDER:RECIEVER);
         args = [target,command].concat(args);
         try
         {
            this._connection.send.apply(this,args);
         }
         catch(e:Error)
         {
            return false;
         }
         return true;
      }
      
      public function get remoting() : uint
      {
         return this._mode;
      }
      
      public function set remoting(param1:uint) : void
      {
         var _loc2_:String = null;
         if(param1 == this._mode)
         {
            return;
         }
         if(param1 == SENDER)
         {
            this._queue = new Array();
            if(!this.startSharedConnection(SENDER))
            {
               report("Could not create remoting client service. You will not be able to control this console with remote.",10);
            }
            this._connection.addEventListener(StatusEvent.STATUS,this.onRemotingStatus,false,0,true);
            report("<b>Remoting started.</b> " + this.getInfo(),-1);
            this._loggedIn = this.checkLogin("");
            if(this._loggedIn)
            {
               this._queue = console.logs.getLogsAsBytes();
               this.send("loginSuccess");
            }
            else
            {
               this.send("requestLogin");
            }
         }
         else if(param1 == RECIEVER)
         {
            if(this.startSharedConnection(RECIEVER))
            {
               this._connection.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.onRemoteAsyncError,false,0,true);
               this._connection.addEventListener(StatusEvent.STATUS,this.onRemoteStatus,false,0,true);
               report("<b>Remote started.</b> " + this.getInfo(),-1);
               _loc2_ = Security.sandboxType;
               if(_loc2_ == Security.LOCAL_WITH_FILE || _loc2_ == Security.LOCAL_WITH_NETWORK)
               {
                  report("Untrusted local sandbox. You may not be able to listen for logs properly.",10);
                  this.printHowToGlobalSetting();
               }
               this.login(this._lastLogin);
            }
            else
            {
               report("Could not create remote service. You might have a console remote already running.",10);
            }
         }
         else
         {
            this.close();
         }
         console.panels.updateMenu();
      }
      
      public function set remotingPassword(param1:String) : void
      {
         this._password = param1;
         if(this._mode == SENDER && !param1)
         {
            this.login();
         }
      }
      
      private function onRemotingStatus(param1:StatusEvent) : void
      {
         if(param1.level == "error")
         {
            this._loggedIn = false;
         }
      }
      
      private function onRemotingSecurityError(param1:SecurityErrorEvent) : void
      {
         report("Remoting security error.",9);
         this.printHowToGlobalSetting();
      }
      
      private function onRemoteAsyncError(param1:AsyncErrorEvent) : void
      {
         report("Problem with remote sync. [<a href=\'event:remote\'>Click here</a>] to restart.",10);
         this.remoting = NONE;
      }
      
      private function onRemoteStatus(param1:StatusEvent) : void
      {
         if(this.remoting == Remoting.RECIEVER && param1.level == "error")
         {
            report("Problem communicating to client.",10);
         }
      }
      
      private function getInfo() : String
      {
         return "</p5>channel:<p5>" + config.remotingConnectionName + " (" + Security.sandboxType + ")";
      }
      
      private function printHowToGlobalSetting() : void
      {
         report("Make sure your flash file is \'trusted\' in Global Security Settings.",-2);
         report("Go to Settings Manager [<a href=\'event:settings\'>click here</a>] &gt; \'Global Security Settings Panel\' (on left) &gt; add the location of the local flash (swf) file.",-2);
      }
      
      private function startSharedConnection(param1:uint) : Boolean
      {
         var targetmode:uint = param1;
         this.close();
         this._mode = targetmode;
         this._connection = new LocalConnection();
         if(config.allowedRemoteDomain)
         {
            this._connection.allowDomain(config.allowedRemoteDomain);
            this._connection.allowInsecureDomain(config.allowedRemoteDomain);
         }
         this._connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRemotingSecurityError,false,0,true);
         this._connection.client = this._client;
         try
         {
            this._connection.connect(config.remotingConnectionName + this._mode);
         }
         catch(err:Error)
         {
            return false;
         }
         return true;
      }
      
      public function registerClient(param1:String, param2:Function) : void
      {
         this._client[param1] = param2;
      }
      
      private function loginFail() : void
      {
         if(this.remoting != Remoting.RECIEVER)
         {
            return;
         }
         report("Login Failed",10);
         console.panels.mainPanel.requestLogin();
      }
      
      private function loginSuccess() : void
      {
         console.setViewingChannels();
         report("Login Successful",-1);
      }
      
      private function requestLogin() : void
      {
         if(this.remoting != Remoting.RECIEVER)
         {
            return;
         }
         if(this._lastLogin)
         {
            this.login(this._lastLogin);
         }
         else
         {
            console.panels.mainPanel.requestLogin();
         }
      }
      
      public function login(param1:String = null) : void
      {
         if(this.remoting == Remoting.RECIEVER)
         {
            this._lastLogin = param1;
            report("Attempting to login...",-1);
            this.send("login",param1);
         }
         else if(this._loggedIn || this.checkLogin(param1))
         {
            this._loggedIn = true;
            this._queue = console.logs.getLogsAsBytes();
            this.send("loginSuccess");
         }
         else
         {
            this.send("loginFail");
         }
      }
      
      private function checkLogin(param1:String) : Boolean
      {
         return !this._password || this._password == param1;
      }
      
      public function close() : void
      {
         if(this._connection)
         {
            try
            {
               this._connection.close();
            }
            catch(error:Error)
            {
               report("Remote.close: " + error,10);
            }
         }
         this._mode = NONE;
         this._connection = null;
         this._queue = null;
      }
   }
}
