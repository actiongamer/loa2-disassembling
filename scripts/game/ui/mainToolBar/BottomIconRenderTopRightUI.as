package game.ui.mainToolBar
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointNumUI;
   import game.ui.commons.comps.others.RedPointNewUI;
   
   public class BottomIconRenderTopRightUI extends View
   {
      
      protected static var uiView:XML = <View width="64" height="64" mouseEnabled="false">
			  <Box x="-63" y="52" var="box_salesRefreshed" mouseEnabled="false" mouseChildren="false">
			    <Image skin="png.uiMiniMap.新手引导-对话框bj004" var="txt_bg" smoothing="true" x="95" y="20" width="260" height="88" anchorX="0.5" anchorY="0.2"/>
			    <Label text="限时优惠刷新啦！" autoSize="left" multiline="true" wordWrap="true" var="txt_content" leading="-2" letterSpacing="1" style="普通说明" size="14" color="0xfff8c7" x="0" width="185" y="27" align="center" height="40"/>
			  </Box>
			  <Box x="-3" y="-1" var="box_icon" width="99" height="97" mouseEnabled="false">
			    <Image skin="png.uiMainToolBar.img_bg" x="6" y="3"/>
			    <Image skin="png.a5.comps.img_block" var="img_bg" autoSize="true" width="64" height="64" anchorX="0.5" anchorY="0.5" x="35" y="33"/>
			    <Image skin="png.a5.commonImgs.img_redPoint" x="51" y="3" var="img_redPoi"/>
			    <RedPointNum x="46" var="countPoint" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			    <Label text="渐变渐变" autoSize="none" y="46" style="渐变4" align="center" var="txt_names" mouseChildren="false" mouseEnabled="false" height="55" size="15" width="87" centerX="-14" x="-8" wordWrap="true" leading="-5" multiline="true"/>
			    <Label text="20:00开启" autoSize="none" y="66" style="普通绿色" align="center" var="txt_time" mouseChildren="false" mouseEnabled="false" size="12" width="110" centerX="-14" x="0"/>
			  </Box>
			  <RedPointNew x="1" y="0" var="stateIcon" runtime="game.ui.commons.comps.others.RedPointNewUI"/>
			</View>;
       
      
      public var box_salesRefreshed:Box = null;
      
      public var txt_bg:Image = null;
      
      public var txt_content:Label = null;
      
      public var box_icon:Box = null;
      
      public var img_bg:Image = null;
      
      public var img_redPoi:Image = null;
      
      public var countPoint:RedPointNumUI = null;
      
      public var txt_names:Label = null;
      
      public var txt_time:Label = null;
      
      public var stateIcon:RedPointNewUI = null;
      
      public function BottomIconRenderTopRightUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNewUI"] = RedPointNewUI;
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
