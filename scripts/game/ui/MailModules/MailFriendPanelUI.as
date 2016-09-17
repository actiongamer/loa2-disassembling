package game.ui.MailModules
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.List;
   
   public class MailFriendPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="170" height="245">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tipMenuBg" sizeGrid="20,20,20,20" width="170" height="245" x="-1" y="-1" var="imgBg"/>
			  <List x="12" y="13" repeatY="8" width="145" var="listFriends" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" height="216">
			    <MailFriendRender name="render" mouseChildren="false" runtime="game.ui.MailModules.MailFriendRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var imgBg:Image = null;
      
      public var listFriends:List = null;
      
      public function MailFriendPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.MailModules.MailFriendRenderUI"] = MailFriendRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
