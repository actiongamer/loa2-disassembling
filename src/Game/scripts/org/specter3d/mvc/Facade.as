package org.specter3d.mvc
{
   import org.specter3d.utils.HashMap;
   import flash.utils.Dictionary;
   import org.specter3d.mvc.vo.CmdVO;
   import org.specter3d.interfaces.IMediator;
   import org.specter3d.interfaces.INotification;
   import org.specter3d.interfaces.IObserver;
   
   public final class Facade
   {
      
      protected static var _instance:org.specter3d.mvc.Facade;
      
      private static var _cmdDic:HashMap = new HashMap();
       
      
      protected const SINGLETON_MSG:String = "Facade Singleton already constructed!";
      
      private var _mediatorMap:HashMap;
      
      private var _observerMap:HashMap;
      
      private var _commandDic:Dictionary;
      
      public function Facade()
      {
         _commandDic = new Dictionary();
         super();
         if(_instance != null)
         {
            throw Error("Facade Singleton already constructed!");
         }
         _instance = this;
         _observerMap = new HashMap();
         _mediatorMap = new HashMap();
      }
      
      public static function get instance() : org.specter3d.mvc.Facade
      {
         !_instance && new org.specter3d.mvc.Facade();
         return _instance;
      }
      
      function dispatcherCommand(param1:*, param2:Object = null) : void
      {
         var _loc9_:int = 0;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = undefined;
         var _loc8_:* = null;
         var _loc4_:Array = _cmdDic.getValue(param1) as Array;
         if(!_loc4_)
         {
            return;
         }
         var _loc7_:int = _loc4_.length;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc3_ = _loc4_[_loc9_];
            _loc6_ = _loc3_.command;
            _loc5_ = _loc3_.target;
            if(_commandDic[param1])
            {
               _loc8_ = _commandDic[param1][_loc9_] as Command;
            }
            else
            {
               _commandDic[param1] = [];
            }
            if(_loc8_ == null)
            {
               _commandDic[param1][_loc9_] = new _loc6_() as Command;
               _loc8_ = _commandDic[param1][_loc9_];
            }
            _loc8_.targetModel = _loc5_;
            _loc8_.cmd = param1;
            _loc8_.data = param2;
            _loc8_.execute();
            _loc8_.dispose();
            _loc9_++;
         }
      }
      
      function hasMediator(param1:String) : Boolean
      {
         return _mediatorMap.containsKey(param1);
      }
      
      function registerMediator(param1:IMediator) : void
      {
         _mediatorMap.put(param1.getMediatorName(),param1);
         param1.onRegister();
      }
      
      function removeMediator(param1:String) : IMediator
      {
         var _loc2_:IMediator = _mediatorMap.remove(param1);
         _loc2_.onRemove();
         return _loc2_;
      }
      
      public function sendNotification(param1:String, param2:Object = null, param3:String = null) : void
      {
         notifyObservers(new Notification(param1,param2,param3));
      }
      
      function startup(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = _mediatorMap.getValue(param1[_loc3_]) as IMediator;
            _loc2_ && _loc2_.startup();
            _loc3_++;
         }
      }
      
      function notifyObservers(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:Array = _observerMap.getValue(param1.getName()) as Array;
         if(_loc3_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc2_ = _loc3_[_loc4_] as IObserver;
               _loc2_.notifyObserver(param1);
               _loc4_++;
            }
         }
      }
      
      function registerCommand(param1:*, param2:Class, param3:Model = null) : void
      {
         var _loc5_:CmdVO = new CmdVO();
         _loc5_.cmd = param1;
         _loc5_.command = param2;
         _loc5_.target = param3;
         var _loc4_:Array = _cmdDic.getValue(param1) as Array;
      }
      
      function registerObserver(param1:String, param2:IObserver) : void
      {
         var _loc4_:Array = _observerMap.getValue(param1) as Array;
         if(!_loc4_)
         {
            _loc4_ = [];
            _observerMap.put(param1,_loc4_);
         }
         var _loc3_:int = _loc4_.indexOf(param2);
      }
   }
}
