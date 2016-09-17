package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import game.ui.heroCompare.render.HCCellRenderUI;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   
   public class HCCellRender extends HCCellRenderUI
   {
       
      
      public var xiahuaxian:Boolean = false;
      
      public function HCCellRender()
      {
         super();
         this.txt_value.text = "";
         this.img_rp.visible = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 == null)
         {
            this.txt_value.text = "-";
            this.txt_value.style = "不足禁止红";
            this.img_rp.visible = false;
            return;
         }
         var _loc2_:Array = param1 as Array;
         if(_loc2_.length == 1)
         {
            if(xiahuaxian)
            {
               this.txt_value.format.underline = true;
            }
            this.txt_value.text = _loc2_[0] as String;
            this.txt_value.style = "普通说明";
            this.img_rp.visible = false;
         }
         else
         {
            if(_loc2_[0] is UInt64 && _loc2_[1] is UInt64)
            {
               if(Uint64Util.compareValue(_loc2_[0],_loc2_[1]) == -1)
               {
                  this.txt_value.style = "不足禁止红";
                  this.img_rp.visible = true;
               }
               else if(Uint64Util.compareValue(_loc2_[0],_loc2_[1]) == 1)
               {
                  this.txt_value.style = "普通绿色";
                  this.img_rp.visible = false;
               }
               else
               {
                  this.txt_value.style = "普通说明";
                  this.img_rp.visible = false;
               }
            }
            else if(_loc2_[0] is Number && _loc2_[1] is Number)
            {
               if(Math.round(_loc2_[0]) < Math.round(_loc2_[1]))
               {
                  this.txt_value.style = "不足禁止红";
                  this.img_rp.visible = true;
               }
               else if(Math.round(_loc2_[0]) > Math.round(_loc2_[1]))
               {
                  this.txt_value.style = "普通绿色";
                  this.img_rp.visible = false;
               }
               else
               {
                  this.txt_value.style = "普通说明";
                  this.img_rp.visible = false;
               }
            }
            else if(_loc2_[0] < _loc2_[1])
            {
               this.txt_value.style = "不足禁止红";
               this.img_rp.visible = true;
            }
            else if(_loc2_[0] > _loc2_[1])
            {
               this.txt_value.style = "普通绿色";
               this.img_rp.visible = false;
            }
            else
            {
               this.txt_value.style = "普通说明";
               this.img_rp.visible = false;
            }
            if(xiahuaxian)
            {
               this.txt_value.format.underline = true;
            }
            this.txt_value.text = _loc2_[2] as String;
         }
      }
   }
}
