package nslm2.modules.cultivates.fashionAcc
{
   import game.ui.fashionAcc.FashionAccSkillWindowUI;
   
   public class FashionAccSkillWindow extends FashionAccSkillWindowUI
   {
       
      
      public function FashionAccSkillWindow()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.skill1.dataSource = 1;
         this.skill2.dataSource = 2;
         this.panelBg.titleImgId = 630106;
         super.preShowCpl();
      }
   }
}
