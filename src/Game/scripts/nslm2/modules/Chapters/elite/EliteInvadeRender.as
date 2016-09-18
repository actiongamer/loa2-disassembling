package nslm2.modules.Chapters.elite
{
   import game.ui.chapters.eliteDungeon.EliteInvadeRenderUI;
   import nslm2.modules.Chapters.EliteInvadeModel;
   
   public class EliteInvadeRender extends EliteInvadeRenderUI
   {
       
      
      public function EliteInvadeRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.list_monsters.dataSource = EliteInvadeModel.ins.getEliteStageArrByTime(dataSource as int);
      }
   }
}
