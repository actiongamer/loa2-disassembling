package nslm2.modules.battles.resourceDungeons
{
   import game.ui.resourceDungeonModule.RDProcessRenderUI;
   
   public class ResDgProcessRender extends RDProcessRenderUI
   {
      
      public static const WW:int = 51;
       
      
      public function ResDgProcessRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
      }
   }
}
