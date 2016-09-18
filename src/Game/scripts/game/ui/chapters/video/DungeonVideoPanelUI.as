package game.ui.chapters.video
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class DungeonVideoPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView scaleY="1" width="536" height="320">
			  <PanelBgS3 width="536" height="320" panelDragEnabled="true" x="-1" y="0" frameStyle="2"/>
			  <Image skin="png.a5.commonImgs.img_shoushaBg" x="21" y="80"/>
			  <Label text="\l40400044" x="270" y="92" width="237" height="18" style="下划线黄色" align="center"/>
			  <Image skin="png.a5.commonImgs.img_crown" x="162" y="50" lgx="162,162,162,162,162,162,162,100" lgy="50,50,50,50,50,50,50,50" language="ru"/>
			  <List x="26" y="141" repeatY="5" width="122" height="90" var="list_best" spaceY="1">
			    <VideoInfoRender name="render" runtime="game.ui.chapters.video.VideoInfoRenderUI"/>
			  </List>
			  <List x="272" y="141" repeatY="5" width="122" height="90" var="list_limit" spaceY="1">
			    <VideoInfoRender name="render" runtime="game.ui.chapters.video.VideoInfoRenderUI"/>
			  </List>
			  <Label text="\l40400042" x="137" y="53" width="120" height="26" style="普通说明" size="15" align="right"/>
			  <Label text="\l40400043" x="29" y="92" width="232" height="18" style="下划线黄色" align="center"/>
			  <Label text="低调的优雅" autoSize="left" x="258" y="53" width="166" height="25" underline="false" var="txt_shoushaName" style="随品质变化" size="15" mouseChildren="true"/>
			  <Button skin="png.a5.commonImgs.btn_video" x="339" y="49" stateNum="1" width="25" height="25" var="btn_video"/>
			  <Label text="\l41300090" x="29" y="120" width="48" height="18" style="下划线黄色"/>
			  <Label text="\l50200021" x="71" y="120" width="75" height="18" style="下划线黄色"/>
			  <Label text="\l10000004" x="127" y="120" width="97" height="18" style="下划线黄色" align="center"/>
			  <Label text="\l40710406" x="173" y="120" width="86" height="18" style="下划线黄色" align="right"/>
			  <Label text="\l41300090" x="274" y="120" width="59" height="18" style="下划线黄色"/>
			  <Label text="\l50200021" x="316" y="120" width="69" height="18" style="下划线黄色"/>
			  <Label text="\l10000004" x="364" y="120" width="113" height="18" style="下划线黄色" align="center"/>
			  <Label text="\l40710406" x="429" y="120" width="79" height="18" style="下划线黄色" align="right"/>
			</PanelView>;
       
      
      public var list_best:List = null;
      
      public var list_limit:List = null;
      
      public var txt_shoushaName:Label = null;
      
      public var btn_video:Button = null;
      
      public function DungeonVideoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.video.VideoInfoRenderUI"] = VideoInfoRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
