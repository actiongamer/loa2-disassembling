package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.RolePhaseUpTwoPropRenderUI;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class RolePhaseUpTwoPropRender extends RolePhaseUpTwoPropRenderUI
   {
       
      
      public function RolePhaseUpTwoPropRender()
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.img_up,this.img_up.y,2,2));
      }
      
      override public function showValue2() : void
      {
         this.ref_txt_value2.text = NPCPropConsts.ins.showValue(vo.valueNext);
      }
   }
}
