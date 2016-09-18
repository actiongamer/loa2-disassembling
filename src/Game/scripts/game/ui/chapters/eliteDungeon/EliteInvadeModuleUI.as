package game.ui.chapters.eliteDungeon
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   
   public class EliteInvadeModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="371" height="481">
			  <PanelBgS3 x="2" y="2" width="371" height="487"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="16" y="41" width="342" height="434" sizeGrid="20,20,20,20"/>
			  <List x="13" y="72" repeatY="3" spaceY="5" var="list_invade">
			    <EliteInvadeRender name="render" runtime="game.ui.chapters.eliteDungeon.EliteInvadeRenderUI"/>
			  </List>
			  <Label text="\l40400034" x="16" y="45" width="339" height="23" align="center"/>
			  <Label text="\l40400039" x="1" y="451" width="369" height="23" align="center"/>
			  <Label text="\l40400035" autoSize="left" x="39" y="124" width="77" height="18" style="普通说明"/>
			  <Label text="\l40400036" autoSize="left" x="39" y="254" width="77" height="18" style="普通说明"/>
			  <Label text="\l40400037" autoSize="left" x="39" y="387" width="77" height="18" style="普通说明"/>
			</PopModuleView>;
       
      
      public var list_invade:List = null;
      
      public function EliteInvadeModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.eliteDungeon.EliteInvadeRenderUI"] = EliteInvadeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
