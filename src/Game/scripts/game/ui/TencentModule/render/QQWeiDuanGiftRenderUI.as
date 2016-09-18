package game.ui.TencentModule.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS9noNameUI;
   
   public class QQWeiDuanGiftRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="666" height="127">
			  <Image skin="png.uiQQWeiDuanGift.img_render_bg" x="0" y="0"/>
			  <Image skin="png.a5.commonImgs.img_redLabel" x="1" y="3"/>
			  <Label text="普通说明" autoSize="none" x="27" y="62" style="普通说明" width="100" height="56" var="txt_name" multiline="true" wordWrap="true"/>
			  <Button label="按钮" x="535" style="按钮大绿" y="63" var="btn_get"/>
			  <Label text="任务" autoSize="none" x="67" y="11" style="加底标题" size="13" width="60.65" height="20" letterSpacing="2" var="txt_title1"/>
			  <Label text="奖励" autoSize="none" x="251" y="12" style="加底标题" size="13" width="50.65" height="20" letterSpacing="2" var="txt_title2"/>
			  <Label text="剪了个i" autoSize="none" x="414" y="12" style="加底标题" size="13" width="80.65" height="20" letterSpacing="2" var="txt_title3" align="center"/>
			  <List x="169" y="49" repeatX="3" spaceX="6" var="list_gift">
			    <WealthRenderS9noName name="render" runtime="game.ui.commons.icons.WealthRenderS9noNameUI"/>
			  </List>
			  <Box x="414" y="67" var="box_ok">
			    <Image skin="png.a5.commonImgs.勾选框-对勾"/>
			    <Label text="普通绿色" autoSize="none" x="41" y="8" style="普通绿色" var="txt_ok" width="70" height="20"/>
			  </Box>
			  <Box x="419" y="62" var="box_no">
			    <Label text="当前不是自动启动状态" autoSize="none" style="普通说明" width="125" height="58" align="center" var="txt_no" bold="false" multiline="true" wordWrap="true" x="-26" y="-7"/>
			    <Button label="按钮" x="-3" style="按钮中黄" y="18" var="btn_check"/>
			  </Box>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var btn_get:Button = null;
      
      public var txt_title1:Label = null;
      
      public var txt_title2:Label = null;
      
      public var txt_title3:Label = null;
      
      public var list_gift:List = null;
      
      public var box_ok:Box = null;
      
      public var txt_ok:Label = null;
      
      public var box_no:Box = null;
      
      public var txt_no:Label = null;
      
      public var btn_check:Button = null;
      
      public function QQWeiDuanGiftRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9noNameUI"] = WealthRenderS9noNameUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
