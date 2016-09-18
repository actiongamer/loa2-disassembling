package game.ui.guildTechs
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class GuildTechPropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="143" height="24">
			  <Label text="生命申明" autoSize="left" x="0" y="1" height="18" var="txt_name" style="重要提示黄" size="16"/>
			  <Label text="+25685" autoSize="left" x="69" y="0" height="23" var="txt_value" letterSpacing="1" style="重要提示黄" size="16" width="74"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function GuildTechPropRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
