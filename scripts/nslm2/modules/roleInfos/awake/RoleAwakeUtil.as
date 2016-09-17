package nslm2.modules.roleInfos.awake
{
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import proto.HeroInfo;
   import proto.ShenGridNodeInfo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class RoleAwakeUtil
   {
      
      public static const CAN_EQUIP:int = 1;
      
      public static const LEVEL_NOT_AVAIL:int = 2;
      
      public static const COUNT_NOT_AVAIL:int = 3;
      
      public static const CAN_NOT_EQUIP:int = 4;
      
      public static const HAVE_EQUIPPED:int = 0;
      
      private static var model:RoleInfoModel = RoleInfoModel.ins;
      
      public static const PROP_BG:String = "png.uiRoleInfo.awake.英雄-觉醒bj-icon00";
      
      public static var propColorMap:DictHash = new DictHash();
       
      
      public function RoleAwakeUtil()
      {
         super();
      }
      
      public static function checkHeroStatus(param1:StcGridNodeVo, param2:HeroInfo = null) : int
      {
         if(param2 && param2.shengridinfo?param2.shengridinfo.pagenum > param1.id / 1000:model.heroInfo.shengridinfo.pagenum > param1.id / 1000)
         {
            return 0;
         }
         var _loc7_:int = 0;
         var _loc6_:* = !!param2?param2.shengridinfo.nodesinfo:model.heroInfo.shengridinfo.nodesinfo;
         for each(var _loc5_ in !!param2?param2.shengridinfo.nodesinfo:model.heroInfo.shengridinfo.nodesinfo)
         {
            if(_loc5_.id == param1.id)
            {
               return _loc5_.state;
            }
         }
         if(param2 == null || param2.shengridinfo == null)
         {
            param2 = model.heroInfo;
         }
         if(param2.shengridinfo.pagenum < int(param1.id / 1000))
         {
            return 4;
         }
         var _loc4_:WealthVo = WealthUtil.parseCostStr(param1.cost_item);
         var _loc3_:WealthVo = WealthUtil.parseCostStr(param1.cost_ziyuan);
         if(BagModel.ins.getStcCount(_loc4_.sid) >= _loc4_.showCount && BagModel.ins.getStcCount(_loc3_.sid) >= _loc3_.showCount)
         {
            if((!!param2?param2.baseInfo.level:uint(model.heroInfo.baseInfo.level)) < param1.player_lv)
            {
               return 2;
            }
            return 1;
         }
         return 3;
      }
      
      public static function checkCurHeroStatus(param1:HeroInfo = null) : Boolean
      {
         if(param1 && param1.shengridinfo || model.heroInfo && model.heroInfo.shengridinfo)
         {
            var _loc4_:int = 0;
            var _loc3_:* = StcMgr.ins.getGridNodeTable().array;
            for each(var _loc2_ in StcMgr.ins.getGridNodeTable().array)
            {
               if((!!param1?param1.shengridinfo.pagenum:uint(model.heroInfo.shengridinfo.pagenum)) >= _loc2_.pagenum && checkHeroStatus(_loc2_,param1) == 1)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public static function init() : void
      {
         propColorMap.put(1,1);
         propColorMap.put(9,1);
         propColorMap.put(15,2);
         propColorMap.put(7,2);
         propColorMap.put(8,3);
         propColorMap.put(4,4);
         propColorMap.put(10,4);
         propColorMap.put(2,5);
         propColorMap.put(6,5);
         propColorMap.put(3,6);
      }
   }
}
