package nslm2.modules.cultivates.equipGrows.comp
{
   import game.ui.equipGrows.equipSelectors.EquipSelectHeroRenderUI;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.common.model.HeroModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.equipGrows.EquipGrowModel;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import com.greensock.TweenLite;
   
   public class EquipSelectHeroRender extends EquipSelectHeroRenderUI
   {
       
      
      private var _data:HeroInfo;
      
      public function EquipSelectHeroRender()
      {
         super();
         img_arrow.visible = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         .super.dataSource = param1;
         _data = param1 as HeroInfo;
         if(_data)
         {
            if(_data.baseInfo)
            {
               this.txt_name.text = HeroInfoUtil.getName(_data.baseInfo.id,_data.baseInfo.baseId);
               this.img_icon.url = HeroInfoUtil.getHeadIconUrl(_data.baseInfo.id,_data.baseInfo.baseId);
               _loc2_ = HeroModel.ins.getQuality(_data.baseInfo.id,_data.baseInfo.baseId);
               this.txt_name.color = ColorLib.qualityColor(_loc2_);
               WealthUtil.changeQualitySkin(this.img_quality,_loc2_);
               this.img_redPoint.visible = EquipGrowModel.ins.hasNoStrengthedEquip(_data) && FloatBubbleUtil.checkInLevel(4);
            }
            else
            {
               this.txt_name.visible = false;
               this.img_icon.visible = false;
               this.mouseEnabled = false;
               this.mouseChildren = false;
               this.img_quality.visible = false;
               this.img_redPoint.visible = false;
            }
         }
         else
         {
            this.txt_name.visible = false;
            this.img_icon.visible = false;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.img_quality.visible = false;
            this.img_redPoint.visible = false;
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         switch(int(param1) - 1)
         {
            case 0:
               selectBox0.visible = true;
               selectBox1.visible = false;
               TweenLite.to(img_arrow,0.2,{"rotation":0});
               break;
            case 1:
               selectBox0.visible = false;
               selectBox1.visible = true;
               TweenLite.to(img_arrow,0.2,{"rotation":0});
               break;
            case 2:
               TweenLite.to(img_arrow,0.2,{"rotation":-90});
               selectBox0.visible = false;
               selectBox1.visible = true;
         }
      }
   }
}
