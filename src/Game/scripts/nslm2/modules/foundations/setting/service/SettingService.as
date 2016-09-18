package nslm2.modules.foundations.setting.service
{
   import proto.SystemSettingsNotify;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import proto.SystemSettingData;
   import proto.SystemSettingsReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.utils.ArrayUtil;
   
   public class SettingService
   {
      
      private static var _ins:nslm2.modules.foundations.setting.service.SettingService;
       
      
      public var all:Array;
      
      public function SettingService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(2012,server_systemSettings_cpl);
      }
      
      public static function get ins() : nslm2.modules.foundations.setting.service.SettingService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.setting.service.SettingService();
         }
         return _ins;
      }
      
      private function server_systemSettings_cpl(param1:SystemSettingsNotify, param2:ServerEvent) : void
      {
         all = !!param1?param1.all || []:[];
         SettingModel.ins.setAllSettings(all as Array);
         NGUtil.initAfterFirstBattle();
      }
      
      public function save(param1:int, param2:*) : void
      {
         var _loc3_:SystemSettingData = new SystemSettingData();
         _loc3_.id = param1;
         _loc3_.s = param2;
         var _loc4_:SystemSettingsReq = new SystemSettingsReq();
         _loc4_.all = [_loc3_];
         setValue(_loc3_.id,_loc3_.s);
         ServerEngine.ins.send(2011,_loc4_);
      }
      
      public function saveAll(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:SystemSettingsReq = new SystemSettingsReq();
         _loc4_.all = param1;
         if(all)
         {
            _loc5_ = 0;
            while(_loc5_ < param1.length)
            {
               _loc3_ = param1[_loc5_] as SystemSettingData;
               _loc2_ = ArrayUtil.indexByAttr(all,"id",_loc3_.id);
               if(_loc2_ >= 0)
               {
                  all[_loc2_] = _loc3_;
               }
               _loc5_++;
            }
         }
         else
         {
            all = param1;
         }
         ServerEngine.ins.send(2011,_loc4_);
      }
      
      public function setValue(param1:int, param2:String) : void
      {
         var _loc3_:* = null;
         if(all)
         {
            _loc3_ = ArrayUtil.findByAttr(this.all,SystemSettingData.ID.name,param1) as SystemSettingData;
            if(_loc3_)
            {
               _loc3_.s = param2;
            }
         }
      }
      
      public function getValue(param1:int) : String
      {
         var _loc2_:* = null;
         if(all)
         {
            _loc2_ = ArrayUtil.findByAttr(this.all,SystemSettingData.ID.name,param1) as SystemSettingData;
            if(_loc2_)
            {
               return _loc2_.s;
            }
            return null;
         }
         return null;
      }
   }
}
