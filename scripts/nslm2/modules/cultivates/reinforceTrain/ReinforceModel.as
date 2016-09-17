package nslm2.modules.cultivates.reinforceTrain
{
   import com.mz.core.utils.DictHash;
   import proto.MapKey32Value32;
   import proto.SupportInfoNotify;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.nets.sockets.ServerEngine;
   
   public class ReinforceModel
   {
      
      public static const SUPPORT_REINFORCE_LEVEL:int = 1;
      
      public static const NEXT_LEVEL_ACTIVED:String = "next_level_actived";
      
      public static const FLOAT_CPL:String = "float_cpl";
      
      private static var _ins:nslm2.modules.cultivates.reinforceTrain.ReinforceModel;
       
      
      public var curLevel:int = 0;
      
      public var haveRedHero:int = 0;
      
      public var supportReinDict:DictHash;
      
      public function ReinforceModel()
      {
         supportReinDict = new DictHash();
         super();
         ServerEngine.ins.addAlwayHandler(5340,supportInfoCpl);
      }
      
      public static function get ins() : nslm2.modules.cultivates.reinforceTrain.ReinforceModel
      {
         if(!_ins)
         {
            _ins = new nslm2.modules.cultivates.reinforceTrain.ReinforceModel();
         }
         return _ins;
      }
      
      public function initSupportInfo(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            supportReinDict.put(_loc2_.key,_loc2_.value);
         }
      }
      
      public function supportInfoCpl(param1:SupportInfoNotify = null) : void
      {
         if(param1)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.info;
            for each(var _loc2_ in param1.info)
            {
               supportReinDict.put(_loc2_.key,_loc2_.value);
            }
         }
         ObserverMgr.ins.sendNotice("next_level_actived");
      }
   }
}
