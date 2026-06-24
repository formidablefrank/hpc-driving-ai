The lectures and discussions of the **Summer School on HPC Driving AI 2026** highlight a convergent era where High-Performance Computing (HPC) provides the essential infrastructure for Artificial Intelligence (AI), while AI revitalizes traditional scientific computing through surrogate models and automated optimization.

### **Wednesday, June 17: Foundations and Distributed Systems**

#### **1. Morning Keynote: Artificial Intelligence – Paradigm Shift in Human Thought? (Joachim Buhmann)**
*   **Summary:** This lecture explores the transition from traditional "old thinking" (human experts design and validate models) to a "new thinking" paradigm where algorithms learn generalizing models from empirical data.
*   **Detailed Points:**
    *   **The Problem:** Humans are increasingly unable to fully design or understand the complexity of models required to interpret massive datasets.
    *   **The Solution:** Shifting focus to "model control" where humans set the goals and ethical boundaries, but machines perform the heavy lifting of inductive reasoning.
    *   **Impact:** This shift invites humanity to reason about the world in a metaphysical sense, expanding knowledge beyond previous imagination.

#### **2. Microarchitectures and Future Computing Technologies (Panel Discussion)**
*   **Summary:** Experts from AMD and various supercomputing centers (JSC, HLRS) discussed the symbiotic relationship between HPC and AI hardware.
*   **Detailed Points:**
    *   **The "Driving" Debate:** While the industry budget is driven by AI, panelists argued that frontier AI models cannot exist without HPC’s foundational work in interconnects, memory hierarchies, and linear algebra.
    *   **Hardware Divergence:** There is a concern that specialized AI hardware (e.g., TPUs, specialized tensor units) may diverge from general-purpose scientific needs, requiring scientists to "steal" AI features for scientific benefit.

#### **3. Distributed GPU Computing Tutorial: Parallel Jacobi Solver (Mathis Bode)**
*   **Summary:** A technical hands-on session teaching participants how to scale problems across GPU clusters using MPI.
*   **Problem:** Traditional serial solvers cannot handle the scale of modern physics problems; multi-GPU communication introduces complex topology issues.
*   **Solution:** Implementing a **Parallel Jacobi Solver** using CUDA-aware MPI and Remote Direct Memory Access (RDMA) to allow GPUs to communicate directly.
*   **Implementation:** The code uses "ghost rows" (halo exchanges) to share boundary conditions between GPU processes, mapping one MPI rank to one GPU for optimal performance.

---

### **Thursday, June 18: Performance, Portability, and Differentiability**

#### **4. HPC in the Era of AI Datacenters (Hartwig Anzt)**
*   **Summary:** Anzt questioned if current HPC strategies are sufficient given the massive energy requirements of AI.
*   **Detailed Points:** He introduced the concept that "Power is Driving AI," suggesting data centers must be managed as flexible loads on the electrical grid to ensure sustainability.

#### **5. Inside an LLM: Performance Deep Dive with TinyLlama (Marius Kurz)**
*   **Summary:** A walk-through of Large Language Model (LLM) computational blocks to identify and address bottlenecks.
*   **Problem:** AI developers often lose sight of hardware realities due to high-level Python abstractions, leading to poor utilization of GPU silicon.
*   **Solution:** Using an **Optimization Loop** (Profile → Prioritize → Implement → Validate) on a scaled-down "TinyLlama" model.
*   **Implementation:** Kernel fusion (e.g., Flash Attention) was shown to move operators from being bandwidth-bound to compute-bound, improving sequence scaling from quadratic to linear.

#### **6. ROOTing Heterogeneous Computing with SYCL (Monica Dessole)**
*   **Summary:** Integration of the SYCL open standard into the ROOT library to support high-energy physics at CERN.
*   **Problem:** The "Interactive Gap"—scientists need interactive environments (Jupyter) for exploration, but massive LHC datasets require compiled, vendor-neutral hardware acceleration.
*   **Solution:** Developing **SYCLOPS**, a project that enables a SYCL backend for RDataFrame and a SYCL-enabled JIT compiler (Cling).
*   **Impact:** Real-world benchmarks showed speedups of up to **4x** on GPUs compared to multi-threaded CPU execution.

#### **7. Mixed Precision Strategies (Hatem Ltaief)**
*   **Summary:** Using low-precision AI hardware features (FP8, FP4) to accelerate traditional scientific computing.
*   **Problem:** Data movement is the primary bottleneck in HPC; high-precision arithmetic is slow and energy-intensive.
*   **Solution:** Adaptive algorithms that use low precision for data movement and intermediate steps while maintaining high-precision reliability through iterative refinement.
*   **Impact:** Achieving speedups of over **4,000x** by leveraging specialized AI scaling formats for matrix algebra.

#### **8. Differentiable Simulations (Markus Götz)**
*   **Summary:** A lecture on embedding physics-based models directly into neural network training pipelines.
*   **Problem:** Inverse problems (finding the causes of observed physical effects) are computationally expensive and difficult to calibrate manually.
*   **Solution:** Making simulations differentiable allows for gradient-based optimization, essentially treating the physical simulation as a layer in an AI model.

---

### **Friday, June 19: Exascale Science and Convergence**

#### **9. JUPITER: Driving Extreme-Scale AI in Europe (Mathis Bode)**
*   **Summary:** An overview of Europe's first exascale system, JUPITER.
*   **Implementation:** Utilizing 24,000 NVIDIA GH200 superchips, JUPITER includes the **JUPITER AI Factory (JAIF)** and the JARVIS inference module for secure, sovereign AI deployment.

#### **10. Lattice QCD & ICON: Science at the Limit**
*   **Lattice QCD (Jacob Finkenrath):** Discussed using exascale power as a "microscope" for nuclear structure. The memory-bandwidth-bound nature of the Dirac equation is solved using multi-grid solvers and mixed precision.
*   **ICON (Jan Frederik Engels):** Detailed the first global Earth system simulation at **1km resolution**.
*   **Significance:** This research earned a Gordon Bell Prize and represents a move away from parameterizing processes like cloud formation to representing them explicitly.

### **Conclusion of the Summer School**
The sources conclude that the "Infinite Loop" between HPC and AI is now a two-way street: HPC provides the **scalability and foundational math** for AI, while AI provides **surrogate models** that accelerate traditional simulations by orders of magnitude. The future of both fields relies on **performance portability** (SYCL, OpenMP) to avoid vendor lock-in and ensure scientific code survives shifting hardware landscapes.