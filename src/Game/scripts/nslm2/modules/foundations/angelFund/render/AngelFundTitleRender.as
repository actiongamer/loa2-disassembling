package nslm2.modules.foundations.angelFund.render
{
   import game.ui.angelFundModule.render.AngelFundTitleRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.angelFund.vo.AngelFundTitleVo;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.angelFund.model.AngelFundModel;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   
   public class AngelFundTitleRender extends AngelFundTitleRenderUI implements IObserver
   {
       
      
      private var _redPoint:RedPoint;
      
      public function AngelFundTitleRender()
      {
         _redPoint = new RedPoint();
         super();
      }
      
      public function get vo() : AngelFundTitleVo
      {
         return this.dataSource as AngelFundTitleVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            if(ClientConfig.isChineseLang() == false)
            {
               this.txt_name.size = 15;
            }
            this.txt_name.text = vo.str;
            ObserverMgr.ins.regObserver(this);
            _redPoint.top = 2;
            _redPoint.right = 2;
            checkRedPoint();
         }
      }
      
      private function checkRedPoint() : void
      {
         var _loc1_:* = null;
         if(this.vo)
         {
            if(AngelFundModel.ins.showTitleRedPoint(vo.id))
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
      
      public function getFocusNotices() : Array
      {
         return ["MSG_SWITCH_MODULE_REN_POINT"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" === _loc4_)
         {
            _loc3_ = param2 as SwitchModuleRedPointMsg;
            if(_loc3_.moduleId == 900400)
            {
               checkRedPoint();
            }
         }
      }
   }
}
