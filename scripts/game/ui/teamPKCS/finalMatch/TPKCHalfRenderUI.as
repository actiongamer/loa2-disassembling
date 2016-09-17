package game.ui.teamPKCS.finalMatch
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TPKCHalfRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="162" height="54">
			  <Image skin="png.uiTeamPKCS.final.img_kuang" x="0" y="0" var="img_bg"/>
			  <Image skin="png.uiTeamPKCS.img_dot" x="-7" y="-6" var="img_dot"/>
			  <Label text="普通说明\n说明" autoSize="none" x="10" y="9" style="普通说明" width="142" height="40" align="center" var="txt_info"/>
			  <Label text="1" autoSize="none" x="-4" y="-3" style="普通说明" width="15" height="16" align="center" var="txt_index"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_dot:Image = null;
      
      public var txt_info:Label = null;
      
      public var txt_index:Label = null;
      
      public function TPKCHalfRenderUI()
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
