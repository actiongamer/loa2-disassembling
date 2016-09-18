package game.ui.teamGuajiScenes.pvp.saodang
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class PvPSaoDangMainRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="257" height="120">
			  <Box x="2" y="1" var="box_main">
			    <Image skin="png.uiTeamGuajiPvP.img_diamond" y="3" x="8"/>
			    <Label text="\l40400007" autoSize="left" x="19" var="txt_title" width="92" height="16" style="小标题"/>
			    <Label text="\l40400050" x="18" y="88" width="221" height="20" var="txt_saodangResult" style="普通说明"/>
			    <Image skin="png.a5.commonImgs.线" y="21" width="249"/>
			    <Image skin="png.a5.bgs.listRenderBgs.renderBgS5" x="0" y="29" width="252" height="84" sizeGrid="20,20,20,40"/>
			    <List x="15" y="47" repeatX="4" spaceX="8" var="list_item">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			  </Box>
			</View>;
       
      
      public var box_main:Box = null;
      
      public var txt_title:Label = null;
      
      public var txt_saodangResult:Label = null;
      
      public var list_item:List = null;
      
      public function PvPSaoDangMainRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
