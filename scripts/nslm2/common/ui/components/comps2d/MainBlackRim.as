package nslm2.common.ui.components.comps2d
{
   import com.mz.core.components.comp2d.BlackRim;
   import morn.core.components.Image;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   import com.greensock.TweenLite;
   
   public class MainBlackRim extends BlackRim
   {
      
      public static const BORDER:int = 3;
       
      
      private var gameRim:Image;
      
      public function MainBlackRim()
      {
         super();
         gameRim = new Image(UrlLib.gameMainRim());
         gameRim.sizeGrid = "100,100,100,100";
         gameRim.mouseEvent = false;
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this.width = UIMgr.stage.fullScreenWidth;
         this.height = UIMgr.stage.fullScreenHeight;
         this.hole.width = ClientConfig.SCENE_FIXED_W;
         this.hole.height = ClientConfig.SCENE_FIXED_H;
         this.addChild(gameRim);
         gameRim.alpha = 0;
         TweenLite.to(gameRim,1.2,{"alpha":1});
         this.draw();
      }
      
      override public function draw() : void
      {
         super.draw();
         if(gameRim)
         {
            gameRim.x = this.hole.x;
            gameRim.y = this.hole.y;
            gameRim.width = UIMgr.gameWidth;
            gameRim.height = UIMgr.gameHeight;
         }
      }
   }
}
