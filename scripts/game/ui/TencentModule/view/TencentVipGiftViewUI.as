package game.ui.TencentModule.view
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.customs.components.ClipList;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class TencentVipGiftViewUI extends View
   {
      
      protected static var uiView:XML = <View width="594" height="465">
			  <Image skin="png.uiTencent.右金属框" x="31.5" y="172" sizeGrid="28.5,33,33,28.5" width="531" height="123"/>
			  <List x="67" y="195" repeatX="6" spaceX="20" var="list_gift">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Label autoSize="none" x="32" y="338" style="普通说明" width="543" height="53" size="15" leading="5" var="txt_tip2a" multiline="true" wordWrap="true" text="ciwai"/>
			  <Image skin="png.uiTencent.分割线" x="19" y="397"/>
			  <Button label="我知道了" x="149" y="432" style="按钮大黄" var="btn_know"/>
			  <Button skin="png.a5.comps.img_block" x="329" y="430" var="btn_charge" stateNum="1" width="111" height="34"/>
			  <Image skin="png.uiTencent.gift.框下光" x="205" y="296"/>
			  <Box x="30" y="109" var="box_title2">
			    <Image skin="png.a5.comps.img_block" y="10" var="img_isVip" width="529" height="36"/>
			    <ClipList value="999" clipWidth="15" align="left" url="png.a5.comps.clipList.clipList_S23" x="372" y="14"/>
			    <Image skin="png.uiTencent.gift.数字光" x="347"/>
			  </Box>
			  <Box x="78" y="109" var="box_title1">
			    <Image y="16" var="img_isNotVip" width="424" height="26" skin="png.a5.comps.img_block"/>
			    <ClipList value="999" clipWidth="15" align="left" url="png.a5.comps.clipList.clipList_S23" x="273" y="14" var="clip_num1"/>
			    <Image skin="png.uiTencent.gift.数字光" x="249"/>
			  </Box>
			  <Image skin="png.uiTencent.gift.文字底" x="31" y="323" width="518" height="75"/>
			</View>;
       
      
      public var list_gift:List = null;
      
      public var txt_tip2a:Label = null;
      
      public var btn_know:Button = null;
      
      public var btn_charge:Button = null;
      
      public var box_title2:Box = null;
      
      public var img_isVip:Image = null;
      
      public var box_title1:Box = null;
      
      public var img_isNotVip:Image = null;
      
      public var clip_num1:ClipList = null;
      
      public function TencentVipGiftViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
