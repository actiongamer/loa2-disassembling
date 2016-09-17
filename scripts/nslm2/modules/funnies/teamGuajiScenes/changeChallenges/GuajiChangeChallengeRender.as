package nslm2.modules.funnies.teamGuajiScenes.changeChallenges
{
   import game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import morn.customs.FilterLib;
   
   public class GuajiChangeChallengeRender extends GuajiChangeChallengeRenderUI
   {
       
      
      private var rollMed:RoleGrowFilterMed;
      
      private var vo:StcGuajiVo;
      
      public function GuajiChangeChallengeRender()
      {
         super();
         this.buttonMode = true;
         rollMed = new RoleGrowFilterMed(this,FilterLib.BORDER_YELLOW);
         this.parts.push(new RoleGrowFilterMed(this,FilterLib.BORDER_YELLOW));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         vo = param1 as StcGuajiVo;
         this.toolTip = vo;
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         switch(int(param1) - 1)
         {
            case 0:
               rollMed.hideGlow();
               break;
            case 1:
               break;
            case 2:
               rollMed.showGlow();
         }
      }
   }
}
