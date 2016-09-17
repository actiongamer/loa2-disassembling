package nslm2.modules.roleInfos.phaseUps
{
   import game.ui.roleInfos.phaseUps.PhashUpPropRenderUI;
   import game.ui.roleInfos.NpcProp2Vo;
   import nslm2.common.consts.NPCPropConsts;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class PhashUpPropRender extends PhashUpPropRenderUI
   {
       
      
      private var _showValue:Number = 0;
      
      private var _showValueNext:Number = 0;
      
      public function PhashUpPropRender()
      {
         super();
      }
      
      public function get vo() : NpcProp2Vo
      {
         return dataSource as NpcProp2Vo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.txt_name.text = NPCPropConsts.ins.getLocaleName(vo.propId);
            TweenLite.to(this,0.2,{"showValue":vo.value});
            if(vo.valueNext)
            {
               TweenLite.to(this,0.4,{"showValueNext":vo.valueNext});
               this.img_arrowGreen.visible = true;
               this.txt_valueNext.visible = true;
            }
            else
            {
               this.img_arrowGreen.visible = false;
               this.txt_valueNext.visible = false;
            }
         }
      }
      
      public function get showValue() : Number
      {
         return _showValue;
      }
      
      public function set showValue(param1:Number) : void
      {
         _showValue = param1;
         this.txt_value.text = "+" + LocaleConsts.percentStr(param1);
      }
      
      public function get showValueNext() : Number
      {
         return _showValueNext;
      }
      
      public function set showValueNext(param1:Number) : void
      {
         _showValueNext = param1;
         this.txt_valueNext.text = "+" + LocaleConsts.percentStr(param1);
      }
   }
}
