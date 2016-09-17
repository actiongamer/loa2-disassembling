package nslm2.modules.funnies.renZhengs.vipAuths
{
   import game.ui.renzhengs.vipAuths.RenZhengVipModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.utils.DisplayUtils;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.mgrs.SoundMgr;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.utils.MathUtil;
   
   public class RenZhengVipModule extends RenZhengVipModuleUI
   {
       
      
      public function RenZhengVipModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.txt1.text = LocaleMgr.ins.getStr(60600301);
         this.list_content.array = [1,2,3,4,5,6,7];
         this.txt_date.visible = false;
         if(PlayerModel.ins.vip < 10)
         {
            this.txtQQ.text = LocaleMgr.ins.getStr(60600302);
         }
         else if(EnvConfig.ins.ptId == 82)
         {
            this.txtQQ.text = LocaleMgr.ins.getStr(999000451);
            this.txt_date.visible = true;
            this.txt_date.text = LocaleMgr.ins.getStr(999000450);
         }
         else
         {
            this.txtQQ.text = LocaleMgr.ins.getStr(60600303);
         }
         DisplayUtils.addChildFromGlobal(this.btn_get,this.btn_get_label);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.centerY = NaN;
         super.preShow(param1);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get !== _loc3_)
         {
            if(this.btn_close === _loc3_)
            {
               this.btnCloseHandler();
            }
         }
         else
         {
            VipModel.ins.gotoCharge();
         }
      }
      
      override public function moduleFadeIn(param1:Number = 0) : void
      {
         this.visible = true;
         onResize(null);
         SoundMgr.ins.playTexiaoSound("open_ui");
         TweenLite.from(this,0.4,{
            "y":-this.height,
            "ease":Back.easeOut,
            "onComplete":this.moduleFadeInTypeCpl
         });
         this.fadeIn(0.5);
      }
      
      override protected function onResize(param1:Event) : void
      {
         var _loc2_:int = (UIMgr.gameHeight - this.height) / 2;
         _loc2_ = MathUtil.maxMin(_loc2_,137,20);
         this.y = _loc2_;
         super.onResize(param1);
      }
   }
}
