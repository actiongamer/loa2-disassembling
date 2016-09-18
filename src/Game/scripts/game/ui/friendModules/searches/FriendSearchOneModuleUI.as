package game.ui.friendModules.searches
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   
   public class FriendSearchOneModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="330" height="186">
			  <PanelBgS3 bgBMargin="10,35,10,60" width="330" height="186" x="0" y="0" frameVisible="false"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="4,4,4,4" left="14" right="14" top="36" bottom="16" x="14"/>
			  <Button label="添  加" stateNum="1" buttonMode="true" labelFont="FZZHB" x="228" y="98" var="btn_search" style="按钮小绿"/>
			  <Label x="38" y="76" var="txt_prompt" text="请输入玩家名称" maxChars="12" autoSize="left" style="普通说明"/>
			  <TextInput x="39" y="99" var="txt_search" maxChars="12" autoSize="left" width="185" height="22" skin="png.uiFriend.mains.输入框" style="普通说明" text="asdfasdfasdf" margin="2,1"/>
			</PopModuleView>;
       
      
      public var btn_search:Button = null;
      
      public var txt_prompt:Label = null;
      
      public var txt_search:TextInput = null;
      
      public function FriendSearchOneModuleUI()
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
