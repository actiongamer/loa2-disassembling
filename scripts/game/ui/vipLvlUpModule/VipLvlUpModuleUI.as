package game.ui.vipLvlUpModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.customs.components.ClipList;
   import morn.core.components.Label;
   
   public class VipLvlUpModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <Image skin="png.a5.comps.img_block" x="57" y="-14" var="img_bg" width="551" height="434"/>
			  <Image skin="png.a5.comps.img_block" x="-248" y="-62" var="img_person" width="425" height="557"/>
			  <Image skin="png.a5.comps.img_block" x="336" y="72" var="img_vipbig" width="92" height="63"/>
			  <Image skin="png.a5.comps.img_block" x="245" y="92" var="img_congraduate" width="114" height="28"/>
			  <Image skin="png.a5.comps.img_block" x="105" y="152" var="img_light1" width="205" height="52"/>
			  <Image skin="png.a5.comps.img_block" x="360" y="150" var="img_light2" width="205" height="52"/>
			  <Image skin="png.a5.comps.img_block" x="223" y="157" var="img_enhance"/>
			  <Image skin="png.a5.comps.img_block" x="480" y="157" var="img_gift"/>
			  <ClipList value="30" clipWidth="24" align="left" url="png.a5.comps.clipList.clipList_S17" x="423" y="92" var="txt_vip1"/>
			  <Image skin="png.a5.comps.img_block" x="149" y="154" var="img_vip1" width="42" height="22"/>
			  <Image skin="png.a5.comps.img_block" x="404" y="154" var="img_vip2" width="42" height="22"/>
			  <ClipList value="35" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S14" x="193" y="157" var="txt_vip2"/>
			  <ClipList value="35" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S14" x="450" y="157" var="txt_vip3"/>
			  <Label text="\|30100360" autoSize="none" x="144" y="307" style="普通绿色" var="label_include"/>
			  <Label text="购买体力上限：12" autoSize="none" x="144" y="187" style="普通说明" var="label_enhance1" height="20" align="left"/>
			  <Label text="资源副本次数购买上限：4" autoSize="none" x="144" y="211" style="普通说明" var="label_enhance2" height="20" align="left"/>
			  <Label text="资源副本次数购买上限：4" autoSize="none" x="144" y="235" style="普通说明" var="label_enhance3" height="20" align="left"/>
			  <Label text="资源副本次数购买上限：4" autoSize="none" x="144" y="259" style="普通说明" var="label_enhance4" height="20" align="left"/>
			  <Label text="资源副本次数购买上限：4" autoSize="none" x="144" y="283" style="普通说明" var="label_enhance5" height="20" align="left"/>
			  <Label text="更多精彩，点击继续" autoSize="right" x="135" y="367" style="加底标题" width="255" height="20" align="right" bold="true" letterSpacing="0.55" mouseChildren="false" buttonMode="true" var="label_continue"/>
			  <Label text="……还有更多尊贵权益" autoSize="right" x="151" y="332" style="加底标题" height="20" align="left" bold="true"/>
			  <Label text="……精彩豪礼，1折领取" autoSize="right" x="368" y="283" style="加底标题" height="20" align="left" bold="true" var="label_giftlast"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_person:Image = null;
      
      public var img_vipbig:Image = null;
      
      public var img_congraduate:Image = null;
      
      public var img_light1:Image = null;
      
      public var img_light2:Image = null;
      
      public var img_enhance:Image = null;
      
      public var img_gift:Image = null;
      
      public var txt_vip1:ClipList = null;
      
      public var img_vip1:Image = null;
      
      public var img_vip2:Image = null;
      
      public var txt_vip2:ClipList = null;
      
      public var txt_vip3:ClipList = null;
      
      public var label_include:Label = null;
      
      public var label_enhance1:Label = null;
      
      public var label_enhance2:Label = null;
      
      public var label_enhance3:Label = null;
      
      public var label_enhance4:Label = null;
      
      public var label_enhance5:Label = null;
      
      public var label_continue:Label = null;
      
      public var label_giftlast:Label = null;
      
      public function VipLvlUpModuleUI()
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
