package nslm2.modules.dungeons.scripts.comps
{
   import game.ui.dungeonScene.DramaSayS3UI;
   import nslm2.common.ctrls.TSM;
   import nslm2.common.ui.components.comps2d.TextCDCtrl;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.FilterLib;
   import com.greensock.TweenLite;
   import morn.core.handlers.Handler;
   import nslm2.modules.dungeons.scripts.vos.SayVo;
   import flash.geom.Point;
   import morn.core.components.Image;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.easing.Cubic;
   
   public class DramaSayListS3 extends DramaSayS3UI
   {
      
      public static var ins:nslm2.modules.dungeons.scripts.comps.DramaSayListS3;
       
      
      private var tsmLeft:TSM;
      
      private var tsmRight:TSM;
      
      private var oriFontColor:uint;
      
      private var oriFontSize:uint;
      
      private var textCdCtrl:TextCDCtrl;
      
      private var handler;
      
      private var lastSayVoLeft:SayVo;
      
      private var lastSayVoRight:SayVo;
      
      public function DramaSayListS3()
      {
         super();
         this.txt_content.textField.cacheAsBitmap = true;
         this.boxMask.cacheAsBitmap = true;
         this.txt_content.textField.mask = this.boxMask;
         oriFontColor = uint(this.txt_content.color);
         oriFontSize = int(this.txt_content.size);
         this.centerX = 0;
         this.mask0.fillAlpha = 1;
         this.boxMouse.fillAlpha = 0;
         this.boxMouse.buttonMode = true;
         this.btn_skipAll.addEventListener("mouseDown",btn_skipAll_click);
         this.btn_skipAll.label = LocaleMgr.ins.getStr(96200503);
         UIMgr.stage.addEventListener("click",stage_click);
         this.bottom = 0;
         this.alpha = 0;
         TweenLite.to(this,0.3,{
            "alpha":1,
            "bottom":0
         });
         tsmLeft = new TSM(this.img_left,0.4);
         tsmLeft.set_defaultEase(Cubic.easeOut);
         tsmLeft.addState(44,{
            "alpha":0,
            "x":img_left.x - 100,
            "y":img_left.y + 100
         });
         tsmLeft.toState(44,0);
         tsmRight = new TSM(this.img_right,0.4);
         tsmRight.set_defaultEase(Cubic.easeOut);
         tsmRight.addState(44,{
            "alpha":0,
            "x":img_right.x + 100,
            "y":img_right.y + 100
         });
         tsmRight.toState(44,0);
         textCdCtrl = new TextCDCtrl(this.txt_cd,txtCdFormatFunc,txtCdCpl);
      }
      
      private function btn_skipAll_click(param1:MouseEvent) : void
      {
         UIMgr.stage.removeEventListener("click",stage_click);
         GlobalRef.skipAllScript = true;
         param1.stopImmediatePropagation();
         param1.stopPropagation();
         txtCdCpl();
      }
      
      private function stage_click(param1:MouseEvent) : void
      {
         txtCdCpl();
      }
      
      private function txtCdFormatFunc(param1:int) : String
      {
         return "(" + param1 + LocaleMgr.ins.getStr(998001150) + ")";
      }
      
      private function txtCdCpl() : void
      {
         textCdCtrl.stop();
         img_left.filters = FilterLib.ins.getFilterArr(401);
         img_right.filters = FilterLib.ins.getFilterArr(401);
         TweenLite.to(img_left,0.3,{
            "scaleX":0.8,
            "scaleY":0.8
         });
         TweenLite.to(img_right,0.3,{
            "scaleX":0.8,
            "scaleY":0.8
         });
         Handler.execute(this.handler);
      }
      
      public function add(param1:SayVo, param2:Point, param3:*) : void
      {
         var _loc6_:Image = !!param1.isLeft?this.img_left:this.img_right;
         var _loc5_:Image = param1.isLeft == false?this.img_left:this.img_right;
         var _loc4_:TSM = !!param1.isLeft?this.tsmLeft:this.tsmRight;
         if(param1.isLeft && this.lastSayVoLeft && this.lastSayVoLeft.headerIconUrl == param1.headerIconUrl || param1.isLeft == false && this.lastSayVoRight && this.lastSayVoRight.headerIconUrl == param1.headerIconUrl)
         {
            _loc4_.toState(0,0);
         }
         else
         {
            _loc4_.toState(44,0);
            _loc4_.toState(0);
         }
         _loc6_.skin = param1.headerIconUrl;
         _loc6_.filters = null;
         TweenLite.to(_loc6_,0.3,{
            "scaleX":1,
            "scaleY":1
         });
         this.txt_name.text = param1.name;
         if(param1.fontBold)
         {
            this.txt_content.bold = param1.fontBold;
         }
         else
         {
            this.txt_content.bold = false;
         }
         if(param1.fontColor != null)
         {
            this.txt_content.color = param1.fontColor;
         }
         else
         {
            this.txt_content.color = oriFontColor;
         }
         if(ClientConfig.isRuLang())
         {
            this.txt_content.size = 16;
         }
         else
         {
            this.txt_content.size = oriFontSize;
         }
         this.mask0.x = -this.mask0.width;
         TweenLite.to(this.mask0,0.8,{"x":0});
         this.txt_content.text = param1.content;
         this.handler = param3;
         if(param1.isLeft)
         {
            this.lastSayVoLeft = param1;
         }
         else
         {
            this.lastSayVoRight = param1;
         }
         if(EnvConfig.ins.ptId != 2306)
         {
            textCdCtrl.start(8);
         }
      }
      
      public function hide() : void
      {
         this.cover.visible = false;
         this.btn_skipAll.removeEventListener("mouseDown",btn_skipAll_click);
         UIMgr.stage.removeEventListener("click",stage_click);
         TweenLite.to(this,0.3,{
            "alpha":0,
            "bottom":-200,
            "onComplete":removeSelf
         });
      }
      
      private function removeSelf() : void
      {
         DisplayUtils.removeSelf(this);
      }
   }
}
