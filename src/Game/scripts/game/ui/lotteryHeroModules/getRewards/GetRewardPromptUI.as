package game.ui.lotteryHeroModules.getRewards
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class GetRewardPromptUI extends View
   {
      
      protected static var uiView:XML = <View width="2000" height="1000" var="img_bg">
			  <GRect fillAlpha="0.4" radius="0,0,0,0" lineAlpha="0" width="2000" height="1000" lineColor="0x0" fillColor="0x0" var="img_cover"/>
			  <Box x="786.5" y="407" var="box_bg">
			    <PanelBgS4 btnCloseStyle="2" y="0" x="0"/>
			    <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" x="395" var="btn_close" y="0"/>
			    <Label text="重要提示橘黄" autoSize="none" x="67" y="132" style="重要提示橘黄" width="290" height="47" align="center" var="txt_prompt"/>
			    <Label text="重要提示橘黄" autoSize="none" x="68" y="21" style="二级框标题" width="290" height="28" align="center" var="txt_title"/>
			  </Box>
			  <Image label="按钮" skin="png.a5.commonImgs.btn_opening2" x="971.5" y="471.5" var="img_icon"/>
			</View>;
       
      
      public var img_bg:View = null;
      
      public var img_cover:GRect = null;
      
      public var box_bg:Box = null;
      
      public var btn_close:Button = null;
      
      public var txt_prompt:Label = null;
      
      public var txt_title:Label = null;
      
      public var img_icon:Image = null;
      
      public function GetRewardPromptUI()
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
