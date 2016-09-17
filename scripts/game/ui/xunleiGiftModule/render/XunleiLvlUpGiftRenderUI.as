package game.ui.xunleiGiftModule.render
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.customs.components.ClipList;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class XunleiLvlUpGiftRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="568" height="120">
			  <List x="128" y="15" repeatX="4" spaceX="20" var="list_gift">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Image skin="png.uiQihoo.分割线" x="-7" y="98" width="532" height="17"/>
			  <Box x="18" y="25" var="box_share">
			    <Image skin="png.uiQihoo.分享礼包" y="22"/>
			    <Image skin="png.uiQihoo.迅雷牛X金钻" x="0" y="0"/>
			  </Box>
			  <Box x="28" y="17" var="box_level" width="84" height="55">
			    <Image skin="png.uiQihoo.迅雷牛X金钻" x="-18" y="1"/>
			    <Image skin="png.uiQihoo.级礼包" x="11" y="28"/>
			    <ClipList value="15" clipWidth="13" align="right" url="png.a5.comps.clipList.clipList_S24" x="9" y="29" width="40" height="22" var="clip_level"/>
			  </Box>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" x="-1" y="-1" sizeGrid="10,10,10,10" width="522" height="107" mouseEnabled="false" mouseChildren="false" var="img_cur"/>
			</View>;
       
      
      public var list_gift:List = null;
      
      public var box_share:Box = null;
      
      public var box_level:Box = null;
      
      public var clip_level:ClipList = null;
      
      public var img_cur:Image = null;
      
      public function XunleiLvlUpGiftRenderUI()
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
