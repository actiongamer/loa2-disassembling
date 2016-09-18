package game.ui.roleInfos.tupos
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class RoleTupoGodhoodModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="308" height="312">
			  <Box x="1" y="0" var="box_main">
			    <PanelBgS3 width="305" height="307" bgStyle="1" showTabLine="false" frameVisible="true" frameStyle="1" y="1" x="0"/>
			    <GodhoodRender var="render_item" x="3" runtime="game.ui.roleInfos.tupos.GodhoodRenderUI"/>
			    <Button label="\l11700014" x="94.5" style="按钮大绿" y="256" var="btn_equip"/>
			    <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_cond" width="261" align="center" x="23.5" y="217" backgroundColor="0xcfbeaf" style="不足禁止红" height="20"/>
			  </Box>
			</PopModuleView>;
       
      
      public var box_main:Box = null;
      
      public var render_item:game.ui.roleInfos.tupos.GodhoodRenderUI = null;
      
      public var btn_equip:Button = null;
      
      public var txt_cond:Label = null;
      
      public function RoleTupoGodhoodModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.tupos.GodhoodRenderUI"] = game.ui.roleInfos.tupos.GodhoodRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
