package nslm2.modules.foundations.mainToolBar
{
   import proto.FunctionActionInfo;
   import org.manager.DateUtils;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class BottomIconRenderTopRightTime extends BottomIconRenderTopRight
   {
       
      
      public function BottomIconRenderTopRightTime()
      {
         super();
         this.buttonMode = true;
         this.img_bg.autoSize = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:FunctionActionInfo = param1 as FunctionActionInfo;
         if(_loc2_)
         {
            .super.dataSource = _loc2_.funcid;
         }
         else
         {
            .super.dataSource = param1;
         }
         this.txt_time.visible = true;
         if(_loc2_.status == 0)
         {
            _loc3_ = new DateUtils(_loc2_.starttime * 1000);
            this.txt_time.text = TimeUtils.hiWithZero(_loc3_) + LocaleMgr.ins.getStr(999001101);
         }
         else
         {
            this.txt_time.text = LocaleMgr.ins.getStr(999001100);
         }
      }
   }
}
