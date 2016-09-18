package nslm2.modules.cultivates.horse.comps
{
   import game.ui.horseModules.comps.HorsePropRenderPlayerUI;
   import nslm2.modules.cultivates.horse.vos.HorsePropVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class HorsePropRenderPlayer extends HorsePropRenderPlayerUI
   {
       
      
      private var _horseId:int;
      
      public function HorsePropRenderPlayer()
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().init(this.img_arrow,NaN,2,2));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = param1 as HorsePropVo;
            _horseId = _loc2_.horseId;
            .super.dataSource = _loc2_.npcPropVo;
         }
      }
      
      override public function validateName() : void
      {
         if(vo != null)
         {
            this.ref_txt_name.text = LocaleMgr.ins.getStr(999000049) + NPCPropConsts.ins.getLocaleNameShort2(vo.propId) + ":";
         }
         else
         {
            this.ref_txt_name.text = "";
         }
      }
      
      override public function validateValue() : void
      {
         if(vo)
         {
            showValue();
            if(HorseService.ins.isActived(_horseId))
            {
               this.txt_value.style = "普通说明";
               this.img_arrow.visible = false;
            }
            else
            {
               this.txt_value.style = "普通绿色";
               this.img_arrow.visible = true;
            }
         }
         else
         {
            this.img_arrow.visible = false;
            this.txt_value.text = "";
         }
      }
   }
}
