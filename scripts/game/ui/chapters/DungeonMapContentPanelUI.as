package game.ui.chapters
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Tab;
   
   public class DungeonMapContentPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="1000" height="570">
			  <List var="list_map">
			    <ChapterRender name="render" runtime="game.ui.chapters.ChapterRenderUI"/>
			  </List>
			  <Image skin="png.uiChapter.dungeonMap.img_normalBg" width="1000" height="570" sizeGrid="30,30,30,30" var="img_frame" mouseEnabled="false" mouseChildren="false"/>
			  <Box var="box_elite" mouseChildren="false" mouseEnabled="false" x="0" y="-19">
			    <Image skin="png.uiChapter.dungeonMap.img_corner" y="515"/>
			    <Image skin="png.uiChapter.dungeonMap.img_corner" x="1001" y="515" scaleX="-1"/>
			    <Image skin="png.uiChapter.dungeonMap.img_corner" y="94" scaleY="-1"/>
			    <Image skin="png.uiChapter.dungeonMap.img_corner" x="1001" y="94" scaleY="-1" scaleX="-1"/>
			    <Image skin="png.uiChapter.dungeonMap.img_border" x="446" y="563"/>
			    <Image skin="png.uiChapter.dungeonMap.img_borderHead" x="417"/>
			    <Button label="\l40400041" skin="png.uiChapter.dungeonMap.btn_invade" x="38" y="46" stateNum="1" labelMargin="0,35" var="btn_invade"/>
			  </Box>
			  <Image skin="png.uiChapter.dungeonMap.img_titleBg" x="340" y="19"/>
			  <Label text="第三章 深渊恶魔" autoSize="left" x="342" var="txt_title" y="22" width="320" height="23.611465187072753" align="center" style="普通说明" size="14" bold="true"/>
			  <DungeonListTopRender x="509" y="503" var="ui_top" runtime="game.ui.chapters.DungeonListTopRenderUI"/>
			  <Tab labels="主线,精英" x="747" y="2" style="TAB长倒转" var="tab_change"/>
			  <ChapterEliteAlert x="863" y="26" var="box_alert" runtime="game.ui.chapters.ChapterEliteAlertUI"/>
			</PanelView>;
       
      
      public var list_map:List = null;
      
      public var img_frame:Image = null;
      
      public var box_elite:Box = null;
      
      public var btn_invade:Button = null;
      
      public var txt_title:Label = null;
      
      public var ui_top:game.ui.chapters.DungeonListTopRenderUI = null;
      
      public var tab_change:Tab = null;
      
      public var box_alert:game.ui.chapters.ChapterEliteAlertUI = null;
      
      public function DungeonMapContentPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.ChapterEliteAlertUI"] = game.ui.chapters.ChapterEliteAlertUI;
         viewClassMap["game.ui.chapters.ChapterRenderUI"] = ChapterRenderUI;
         viewClassMap["game.ui.chapters.DungeonListTopRenderUI"] = game.ui.chapters.DungeonListTopRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
