package nslm2.modules.footstones.assistantModules.subAssistants.shenyuan
{
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShenyuanSettingVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.ShenYuanBuff;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class AssisShenyuanUtils
   {
      
      public static var tempNeedBuyBuffArr:Array = [];
       
      
      public function AssisShenyuanUtils()
      {
         super();
      }
      
      public static function addNeedBuyBuffId(param1:int) : void
      {
         tempNeedBuyBuffArr.push(param1);
         ObserverMgr.ins.sendNotice("shenyuanBuffChanged");
      }
      
      public static function removeNeedBuyBuffId(param1:int) : void
      {
         ArrayUtil.removeItem(tempNeedBuyBuffArr,param1);
         ObserverMgr.ins.sendNotice("shenyuanBuffChanged");
      }
      
      public static function getNeedBuyBuffIds() : Array
      {
         var _loc1_:AssistantShenyuanSettingVo = AssistantModel.ins.getSetting(41500);
         return _loc1_.buyBuffArr;
      }
      
      public static function isNeedBuyBuffId(param1:int) : Boolean
      {
         var _loc3_:AssistantShenyuanSettingVo = AssistantModel.ins.getSetting(41500);
         var _loc2_:Array = _loc3_.buyBuffArr;
         return _loc2_.indexOf(param1) != -1;
      }
      
      public static function getNotBuyBuffIds() : Array
      {
         var _loc1_:Array = DefindConsts.SHENYUAN_BUFF_ALL.split("|");
         return ArrayUtil.differenceBetweenArrs(_loc1_,tempNeedBuyBuffArr);
      }
      
      public static function buffDataArrToString(param1:Array) : String
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:Array = [];
         var _loc2_:int = param1.length;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = param1[_loc5_];
            _loc3_ = StcMgr.ins.getBuffVo(_loc4_.id);
            if(_loc3_)
            {
               _loc6_.push(LocaleMgr.ins.getStr(_loc3_.desc) + " +" + (_loc4_.param * 100).toFixed() + "%");
            }
            _loc5_++;
         }
         return _loc6_.join(",");
      }
   }
}
