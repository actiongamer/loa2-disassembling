package nslm2.modules.battles.battle.skillConfig
{
   import flash.utils.Dictionary;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.utils.ByteArray;
   import com.mz.core.logging.Log;
   
   public class SkillConfig
   {
      
      private static var isinit:Boolean = false;
      
      public static var configDic:Dictionary;
      
      public static var hurt_1:Array = [{
         "action":"Act",
         "name":"hurt_1",
         "speed":1,
         "frame":1
      }];
      
      public static var hurt_2:Array = [{
         "action":"Act",
         "name":"hurt_2_1",
         "speed":1,
         "frame":1
      },{
         "action":"MoveSelf",
         "x":0,
         "y":450,
         "z":0,
         "dur":15,
         "frame":1,
         "ease":1
      },{
         "action":"Act",
         "name":"hurt_2_2",
         "speed":1,
         "frame":18
      },{
         "action":"MoveSelf",
         "x":0,
         "y":0,
         "z":0,
         "dur":15,
         "frame":18,
         "ease":2
      },{
         "action":"Act",
         "name":"hurt_4",
         "speed":1,
         "frame":30
      }];
      
      public static var hurt_5:Array = [{
         "action":"DelMove",
         "frame":1
      }];
      
      public static var hurt_3:Array = [{
         "action":"Act",
         "name":"hurt_3",
         "speed":1,
         "frame":1
      },{
         "action":"MoveSelf",
         "x":150,
         "y":0,
         "z":0,
         "dur":3,
         "frame":1
      }];
      
      public static var hurt_4:Array = [{
         "action":"MoveSelf",
         "x":0,
         "y":0,
         "z":0,
         "dur":2,
         "frame":1
      },{
         "action":"Act",
         "name":"hurt_4",
         "speed":1,
         "frame":3
      }];
      
      public static var defaultDie:Array = [{
         "action":"Act",
         "name":"dead",
         "speed":1,
         "frame":1
      }];
       
      
      public function SkillConfig()
      {
         super();
      }
      
      public static function intConfig() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc5_:* = null;
         if(isinit)
         {
            return;
         }
         isinit = true;
         configDic = new Dictionary();
         var _loc4_:ByteArray = ResMgr.ins.getRes(UrlLib.skillConfigUrl()) as ByteArray;
         _loc4_.uncompress("lzma");
         while(true)
         {
            _loc2_ = _loc4_.readUnsignedInt();
            _loc3_ = _loc4_.readUnsignedInt();
            _loc1_ = _loc4_.readUTFBytes(_loc2_);
            _loc5_ = _loc4_.readUTFBytes(_loc3_);
            addConfig(_loc1_,_loc5_);
            if(_loc4_.bytesAvailable != 0)
            {
               continue;
            }
            break;
         }
      }
      
      private static function addConfig(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         if(param2)
         {
            try
            {
               _loc3_ = JSON.parse(param2);
            }
            catch(err:Error)
            {
               Log.fatal(null,"skill脚本解析错误",param1);
               return;
            }
         }
         var _loc8_:int = 0;
         var _loc7_:* = _loc3_;
         for(var _loc4_ in _loc3_)
         {
            configDic[_loc4_] = _loc3_[_loc4_];
         }
      }
   }
}
