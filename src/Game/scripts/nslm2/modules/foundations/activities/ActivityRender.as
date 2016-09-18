package nslm2.modules.foundations.activities
{
   import game.ui.activities.render.ActivityRenderUI;
   import com.mz.core.interFace.IObserver;
   import proto.StaticActivity;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.modules.foundations.activities.utils.ActivityUtil;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   
   public class ActivityRender extends ActivityRenderUI implements IObserver
   {
       
      
      private var _redPoint:RedPoint;
      
      public function ActivityRender()
      {
         _redPoint = new RedPoint();
         super();
      }
      
      private function get vo() : StaticActivity
      {
         return dataSource as StaticActivity;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            if(ClientConfig.isChineseLang() == false)
            {
               this.txt_name.size = 15;
            }
            ObserverMgr.ins.regObserver(this);
            _redPoint.top = 2;
            _redPoint.right = 2;
            this.txt_name.text = this.vo.name;
            checkRedPoint();
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      private function checkRedPoint() : void
      {
         var _loc1_:* = null;
         if(this.vo)
         {
            if(ActivityModel.ins.activityHasCanReward(this.vo.id,true) || ActivityUtil.exchangeArrRedPointCheck(ActivityModel.ins.getRewardVos(this.vo.id),true))
            {
               _loc1_ = Effect2DUtils.showBtnEff_btnBig(this).setScaleXY(1.4,1.4);
               _loc1_.x = -14;
               _loc1_.y = -14;
               this.addChild(_redPoint);
            }
            else
            {
               Effect2DUtils.hideBtnEff_btnBig(this);
               DisplayUtils.removeSelf(_redPoint);
            }
         }
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" === _loc4_)
         {
            _loc3_ = param2 as SwitchModuleRedPointMsg;
            if(_loc3_.moduleId == 60500)
            {
               checkRedPoint();
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_SWITCH_MODULE_REN_POINT"];
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
