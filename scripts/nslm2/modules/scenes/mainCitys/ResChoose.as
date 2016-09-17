package nslm2.modules.scenes.mainCitys
{
   import game.ui.resourceDg.ResChooseUI;
   import morn.customs.components.GRect;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.greensock.TweenMax;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import game.ui.resourceDg.ResCellUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ResChoose extends ResChooseUI
   {
       
      
      private var cells:Array;
      
      private var _maskBg:GRect;
      
      private var _tweenShow:Boolean = false;
      
      public function ResChoose()
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         cells = [];
         super();
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_ = this["cell" + _loc2_] as ResCellUI;
            cells.push(_loc1_);
            _loc2_++;
         }
         cells.push(btn_close_2);
         this.txt_tt.text = LocaleMgr.ins.getStr(41400005);
         this.btn_close_2.visible = false;
      }
      
      private function drawBg() : void
      {
         if(!_maskBg)
         {
            _maskBg = new GRect();
            _maskBg.fillColor = 0;
         }
         _maskBg.width = ClientConfig.SCENE_FIXED_W;
         _maskBg.height = ClientConfig.SCENE_FIXED_H;
         ModuleMgr.ins.staticLayer.addChildAt(this._maskBg,0);
      }
      
      public function fadeIn() : void
      {
         if(_tweenShow)
         {
            return;
         }
         drawBg();
         _tweenShow = true;
         TweenMax.staggerFrom(cells,0.2,{"alpha":0},0.1,onComp);
         NGUtil.regTempFunc(41401,this);
         NGUtil.checkModuleShow(41401);
      }
      
      private function onComp() : void
      {
         _tweenShow = false;
      }
      
      public function fadeOut() : void
      {
         if(_maskBg)
         {
            _maskBg.dispose();
            _maskBg = null;
         }
         NGUtil.unregTempFunc(41401);
      }
      
      override public function dispose() : void
      {
         fadeOut();
         super.dispose();
      }
   }
}
