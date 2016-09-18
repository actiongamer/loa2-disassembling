package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import game.ui.heroCompare.render.HCHeroSubInfoRenderUI;
   
   public class HCHeroSubInfoRender extends HCHeroSubInfoRenderUI
   {
       
      
      public function HCHeroSubInfoRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         txt_value.text = param1 as String;
      }
   }
}
