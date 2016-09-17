package game.ui.chapters
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class DungeonFlagRenderUI extends View
   {
      
      protected static var uiXML:XML = <View width="71" height="105" buttonMode="false" mouseChildren="true">
			  <Box x="21" y="-30" var="box_treasureBox">
			    <Image skin="png.uiChapter.dungeonMap.img_boxShadow" y="18"/>
			    <TreasureBoxBaseRender x="10" var="treasureBox" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  </Box>
			  <Box x="-73" y="-117" var="box_flag">
			    <Image skin="png.a5.comps.img_block" var="img_bottom" autoSize="true" width="41" height="29" anchorX="0.5" anchorY="1" scale="1" buttonMode="true" x="73" y="130"/>
			    <Box var="box_flagAndIcon">
			      <Image skin="png.a5.comps.img_block" var="img_icon" autoSize="false" width="60" height="60" anchorX="0.5" anchorY="1" scale="1" buttonMode="true" x="73" y="105"/>
			      <Label style="普通说明" var="txt_dungeonName" width="149" multiline="false" wordWrap="true" align="center" text="十二个字十二个字十二个字" leading="4" height="19" y="28"/>
			      <Image skin="png.a5.comps.img_block" var="img_flag" autoSize="true" width="50" height="60" anchorX="0.5" anchorY="1" buttonMode="true" x="73" y="115"/>
			      <Box var="box_summary" x="44" y="0" width="149" height="52">
			        <Image skin="png.uiChapter.dungeonMap.summaryBg" x="155" width="166" height="63" sizeGrid="4,5,30,15" scaleX="-1" y="-11"/>
			        <Label y="-10" style="普通说明" var="txt_summary" width="149" multiline="false" wordWrap="true" align="left" text="十二个字十二个字十二个字" leading="4" height="39" x="0"/>
			      </Box>
			      <Box var="box_star" x="51" y="89" mouseChildren="false" mouseEnabled="false">
			        <StarRender name="render" x="30" var="star2" scale="0.6" runtime="game.ui.chapters.StarRenderUI"/>
			        <StarRender name="render" var="star0" scale="0.6" runtime="game.ui.chapters.StarRenderUI"/>
			        <StarRender name="render" x="15" var="star1" scale="0.6" runtime="game.ui.chapters.StarRenderUI"/>
			      </Box>
			    </Box>
			  </Box>
			</View>;
       
      
      public var box_treasureBox:Box = null;
      
      public var treasureBox:TreasureBoxBaseRenderUI = null;
      
      public var box_flag:Box = null;
      
      public var img_bottom:Image = null;
      
      public var box_flagAndIcon:Box = null;
      
      public var img_icon:Image = null;
      
      public var txt_dungeonName:Label = null;
      
      public var img_flag:Image = null;
      
      public var box_summary:Box = null;
      
      public var txt_summary:Label = null;
      
      public var box_star:Box = null;
      
      public var star2:game.ui.chapters.StarRenderUI = null;
      
      public var star0:game.ui.chapters.StarRenderUI = null;
      
      public var star1:game.ui.chapters.StarRenderUI = null;
      
      public function DungeonFlagRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.StarRenderUI"] = game.ui.chapters.StarRenderUI;
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         super.createChildren();
         createView(uiXML);
      }
   }
}
