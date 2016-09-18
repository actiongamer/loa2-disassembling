package game.ui.dailyTaskModules.view
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.dailyTaskModules.ResBackRenderUI;
   
   public class ResourceBackViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="784" height="464">
			  <Image skin="png.uiDailyTask.img_bg1" x="107" y="350"/>
			  <Image skin="png.comp.image" x="0" y="0" var="img_bg"/>
			  <List x="177" y="16" spaceY="1" spaceX="1" width="586" height="354" var="list_item">
			    <ResBackRender name="render" runtime="game.ui.dailyTaskModules.ResBackRenderUI"/>
			  </List>
			  <Label text="\l109000019" autoSize="none" x="278" y="440" style="普通说明" width="180" height="21" var="txt_tip1" align="center"/>
			  <Label text="\l109000016" autoSize="none" x="183" y="377" style="普通说明" width="553" height="20" var="txt_tip0" align="center"/>
			  <Button label="\l109000018" x="473" style="按钮大蓝" y="404" labelMargin="25" var="btn_alldiamond"/>
			  <Button label="\l109000017" x="311" style="按钮大绿" y="404" labelMargin="25" var="btn_allgold"/>
			  <Label text="\l109000020" autoSize="none" x="444" y="440" style="普通说明" width="180" height="21" var="txt_tip2" align="center"/>
			  <Image skin="png.comp.image" x="322" y="410" width="23" height="23" var="img_icon_gold" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.comp.image" x="484" y="410" var="img_icon_diamond" width="23" height="23" mouseEnabled="false" mouseChildren="false" smoothing="false"/>
			</FadeView>;
       
      
      public var img_bg:Image = null;
      
      public var list_item:List = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_tip0:Label = null;
      
      public var btn_alldiamond:Button = null;
      
      public var btn_allgold:Button = null;
      
      public var txt_tip2:Label = null;
      
      public var img_icon_gold:Image = null;
      
      public var img_icon_diamond:Image = null;
      
      public function ResourceBackViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.dailyTaskModules.ResBackRenderUI"] = ResBackRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
