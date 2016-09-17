package game.ui.chapters.video
{
   import morn.customs.components.PanelView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class VideoInfoRenderUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="235" height="25">
			  <Image skin="png.a5.commonImgs.selectBox" name="selectBoxAll" mouseEnabled="false" x="-1" y="0" width="235" height="25"/>
			  <Label x="3" width="30" height="18" var="txt_rank" underline="false" y="4" text="1" style="普通说明" align="center"/>
			  <Label autoSize="left" x="46" width="85" height="18" var="txt_name" y="4" text="低调调的优雅" style="普通说明" underline="false" isHtml="true" mouseChildren="true"/>
			  <Label autoSize="left" x="133" width="57" height="18" var="txt_fight" y="4" text="5487895" style="普通说明"/>
			  <Button skin="png.a5.commonImgs.btn_video" x="199" y="0" stateNum="1" width="25" height="25" var="btn_video"/>
			</PanelView>;
       
      
      public var txt_rank:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_fight:Label = null;
      
      public var btn_video:Button = null;
      
      public function VideoInfoRenderUI()
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
