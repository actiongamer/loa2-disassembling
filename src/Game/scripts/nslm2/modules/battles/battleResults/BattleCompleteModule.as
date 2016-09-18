package nslm2.modules.battles.battleResults
{
   import morn.customs.components.PopModuleView;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import morn.customs.components.FadeView;
   import com.mz.core.utils.DisplayUtils;
   
   public class BattleCompleteModule extends PopModuleView
   {
       
      
      private var _battleWinLogo:nslm2.modules.battles.battleResults.BattleWinLogo;
      
      private var _currPanel:nslm2.modules.battles.battleResults.IBattleWinPanel;
      
      private var configVo:nslm2.modules.battles.battleResults.BattleResultConfigVo;
      
      private var _bg:Sprite;
      
      public function BattleCompleteModule()
      {
         super();
         this.moduleFadeInType = 0;
         var _loc1_:int = 0;
         this.centerY = _loc1_;
         this.centerX = _loc1_;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         configVo = param1 as nslm2.modules.battles.battleResults.BattleResultConfigVo;
         if(configVo == null)
         {
            return;
            §§push(new Error("configVo cannot be null"));
         }
         else
         {
            _currPanel = new BattleCompletePanel();
            this.addChild(_currPanel as DisplayObject);
            _currPanel.init(configVo);
            super.preShow(param1);
            return;
         }
      }
      
      override public function moduleFadeIn(param1:Number = 0) : void
      {
         showDungeonLogo();
         moduleFadeInCpl();
      }
      
      private function showDungeonLogo() : void
      {
         if(!_bg)
         {
            _bg = new Sprite();
            this.parent.addChildAt(_bg,0);
         }
         this._battleWinLogo = new nslm2.modules.battles.battleResults.BattleWinLogo(_bg,true);
         this._battleWinLogo.x = (_currPanel as Sprite).width / 2;
         this._battleWinLogo.y = 304;
         _battleWinLogo.setStar(this.configVo.resVo.star);
         this._battleWinLogo.endFunc = logoComplete;
         _battleWinLogo.play();
         FadeView(_currPanel).addChild(_battleWinLogo);
      }
      
      private function logoComplete() : void
      {
         _currPanel.play();
      }
      
      override public function dispose() : void
      {
         DisplayUtils.removeSelf(_bg);
         _currPanel.dispose();
         _battleWinLogo.dispose();
         super.dispose();
      }
   }
}
