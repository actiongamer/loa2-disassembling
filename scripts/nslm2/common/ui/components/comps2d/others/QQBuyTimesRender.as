package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.QQBuyTimesRenderUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import proto.ArenaInfoRes;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class QQBuyTimesRender extends QQBuyTimesRenderUI implements IObserver
   {
       
      
      public function QQBuyTimesRender()
      {
         super();
         this.txt_qqAlert.visible = false;
         ObserverMgr.ins.regObserver(this);
      }
      
      public function curTimes(param1:int) : void
      {
         this.txt_qqAlert.visible = EnvConfig.ins.showQQModule && param1 == 0;
      }
      
      public function alert(param1:String) : void
      {
         this.txt_alert.text = param1;
      }
      
      public function getFocusNotices() : Array
      {
         return ["changeContent","changeContentArena"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = param1;
         if("changeContent" !== _loc6_)
         {
            if("changeContentArena" === _loc6_)
            {
               _loc4_ = param2 as ArenaInfoRes;
               this.txt_alert.text = LocaleMgr.ins.getStr(50200012,[_loc4_.buyTimesDiamond]) + "\n" + LocaleMgr.ins.getStr(50200107,[_loc4_.buyTimesCount,int(VipModel.ins.getVipValue(10210))]);
               this.txt_qqAlert.visible = EnvConfig.ins.showQQModule && _loc4_.buyTimesCount == 0;
            }
         }
         else
         {
            _loc5_ = param2.buyKind;
            _loc3_ = param2.vipLimitId;
            this.txt_alert.text = LocaleMgr.ins.getStr(50200012,[TimePriceUtil.curTimePriceVo(_loc5_).count]) + "\n" + LocaleMgr.ins.getStr(50200107,[TimePriceUtil.curTimes(_loc5_),int(VipModel.ins.getVipValue(_loc3_))]);
            this.txt_qqAlert.visible = EnvConfig.ins.showQQModule && TimePriceUtil.curTimes(_loc5_) == 0;
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
