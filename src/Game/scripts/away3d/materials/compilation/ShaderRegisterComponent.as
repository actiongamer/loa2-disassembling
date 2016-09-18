package away3d.materials.compilation
{
   public class ShaderRegisterComponent
   {
       
      
      public var elementIndex:int;
      
      public var componentIndex:int;
      
      private var _toStr:String;
      
      public function ShaderRegisterComponent(param1:ShaderRegisterElement, ... rest)
      {
         super();
         elementIndex = param1.index * 4;
         componentIndex = ShaderRegisterElement.COMPONENTS.indexOf(rest[0]);
         var _loc3_:int = rest.length;
         _toStr = param1.toString() + "." + rest;
      }
      
      public function get dataIndex() : int
      {
         return elementIndex + componentIndex;
      }
      
      public function toString() : String
      {
         return _toStr;
      }
   }
}
