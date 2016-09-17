package game.ui.salesModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.customs.components.ClipList;
   import game.ui.salesModule.render.SalesItemRenderUI;
   
   public class SalesItemsViewUI extends View
   {
      
      protected static var uiView:XML = <View width="724" height="416">
			  <Image skin="png.a5.comps.img_block" x="-18" y="108" width="264" height="299" var="img_icon"/>
			  <Label text="\l60540010" autoSize="none" x="22" y="46" style="普通说明" size="16" width="181" height="109" multiline="true" wordWrap="true" leading="7" var="label_cannotCharge" align="center" visible="false"/>
			  <List x="240" y="26" repeatX="2" repeatY="3" spaceX="13" spaceY="13" var="list_sales">
			    <SalesItemRender name="render" runtime="game.ui.salesModule.render.SalesItemRenderUI"/>
			  </List>
			  <Image skin="png.a5.comps.img_block" x="341" y="363" var="img_refreshBg" width="260" height="30"/>
			  <Label text="距离下次刷新：11时45分30秒" autoSize="none" x="270" y="367" style="普通说明" width="405" height="22" var="label_nextRefresh" align="center" size="15"/>
			  <Label autoSize="none" style="普通说明" size="16" width="182" height="233" multiline="true" wordWrap="true" leading="7" var="label_canCharge" align="center" text="1\n\n2\n\n3" visible="false" x="21" y="27"/>
			  <Box x="0" y="18" var="box_canCharge">
			    <Label text="50元" autoSize="none" style="渐变3" width="182" height="25" align="center" size="19" var="label_charge" y="36" x="18" visible="false"/>
			    <Label text="150钻" autoSize="none" y="90" style="渐变3" width="75" height="27" align="right" size="19" var="label_return" visible="true"/>
			    <Box x="155" y="38">
			      <ClipList clipWidth="18" align="right" url="png.a5.comps.clipList.clipList_S20" width="59" height="25" value="100" gapX="-5" var="clip_charge"/>
			    </Box>
			    <ClipList clipWidth="18" align="left" url="png.a5.comps.clipList.clipList_S20" y="92" width="59" height="25" value="100" gapX="-5" x="112" var="clip_reward"/>
			    <Label text="150钻" autoSize="none" y="36" style="渐变3" width="75" height="27" align="right" size="19" var="label_return1" visible="true"/>
			    <Label text="\l999900222" autoSize="none" x="31" style="渐变1" width="175" height="30" align="center" size="20" multiline="true" wordWrap="true"/>
			    <Label text="\l999900223" autoSize="none" x="31" y="64" style="渐变1" width="175" height="30" align="center" size="20" multiline="true" wordWrap="true"/>
			    <Label text="\l999900224" autoSize="none" x="18" y="116" style="渐变1" width="189" height="266" align="center" size="18" multiline="true" wordWrap="true"/>
			  </Box>
			  <Label text="\l999900225" autoSize="none" x="13" y="27" style="渐变1" width="211" height="383" align="center" size="22" multiline="true" wordWrap="true" var="img_cannotcharge"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var label_cannotCharge:Label = null;
      
      public var list_sales:List = null;
      
      public var img_refreshBg:Image = null;
      
      public var label_nextRefresh:Label = null;
      
      public var label_canCharge:Label = null;
      
      public var box_canCharge:Box = null;
      
      public var label_charge:Label = null;
      
      public var label_return:Label = null;
      
      public var clip_charge:ClipList = null;
      
      public var clip_reward:ClipList = null;
      
      public var label_return1:Label = null;
      
      public var img_cannotcharge:Label = null;
      
      public function SalesItemsViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.salesModule.render.SalesItemRenderUI"] = SalesItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
