package nslm2.common.scene.multiLayer.configs
{
   public class BgModel3DVo extends BgTargetConfigVoBase
   {
       
      
      public var id:int;
      
      public var action:String;
      
      public var transfrom3d:nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
      
      public function BgModel3DVo()
      {
         super();
      }
      
      override public function parse(param1:XML) : void
      {
         super.parse(param1);
         id = int(param1.id);
         this.action = BgConfigVoUtil.parseXMLStr(param1.action,"run_3");
         if(param1.transfrom3d)
         {
            transfrom3d = new nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo();
            transfrom3d.parse(param1.transfrom3d[0]);
         }
      }
   }
}
