package nslm2.modules.foundations.mainToolBar
{
   import game.ui.mainToolBar.ExpBarUI;
   import nslm2.common.ctrls.TSM;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import morn.customs.StyleLib;
   import flash.geom.Rectangle;
   import com.mz.core.mediators.RollMediator;
   
   public class ExpBar extends ExpBarUI
   {
       
      
      private var stateTweenCtrl:TSM;
      
      public function ExpBar()
      {
         super();
         this.boxBar.scrollRect = new Rectangle(0,0,boxBar.width,boxBar.height);
         this.parts.push(new RollMediator(this,onRoll));
         this.txt_value.mouseEvent = false;
         stateTweenCtrl = new TSM(this.txt_value,0.2).addState(1,{"alpha":0});
         stateTweenCtrl.toState(1,0);
      }
      
      public function tweenW(param1:int, param2:int) : void
      {
         var _loc3_:Number = (param1 + param2) / this.width;
         TweenLite.to(this.boxBar,0.6,{
            "scaleX":_loc3_,
            "ease":Cubic.easeInOut
         });
         TweenLite.to(this,0.6,{
            "x":-param1,
            "ease":Cubic.easeInOut
         });
         TweenLite.to(this.txt_value,0.6,{
            "x":this.width / 2 - txt_value.width / 2,
            "ease":Cubic.easeInOut
         });
      }
      
      public function refresh() : void
      {
         this.img_bar.width = this.width * (PlayerModel.ins.exp / PlayerModel.ins.expNeed);
         this.img_tail.x = this.img_bar.width + 6;
         var _loc1_:WealthVo = new WealthVo();
         _loc1_.kind = 10;
         _loc1_.useStcCount = true;
         this.toolTip = _loc1_;
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(param1)
         {
            this.txt_value.text = PlayerModel.ins.exp + "/" + PlayerModel.ins.expNeed + "  " + TextFieldUtil.htmlText2(LocaleConsts.percentStrInt(PlayerModel.ins.exp / PlayerModel.ins.expNeed * 100),StyleLib.ins.getConfigVo("普通绿色").color);
            stateTweenCtrl.toState(0);
         }
         else
         {
            stateTweenCtrl.toState(1,0.6);
         }
      }
   }
}
