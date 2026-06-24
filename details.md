This report organizes the technical presentations from the **Summer School on HPC Driving AI 2026** into structured lecture reports, integrating audio transcripts and PDF slide material.

---

### **Lecture 1: Introduction to Modern HPC Architectures & Future Technologies**
#### **A. Lecture identification**
*   **Title:** Microarchitectures and Future Computing Technologies
*   **Speaker:** Dr.-Ing. Michael Klemm (AMD) and Panelists
*   **Date:** June 17, 2026 (1:00 PM Session)
*   **Related PDF:** `Klemm_OpenMPatHPCSummerSchool.pdf`, `Domke_2026.05.18-HPC4AI-Heilbronn-Lecture.pdf`
*   **Related Audio:** `2026-06-17 13-16-21.mp3`
<!-- *   **Confidence:** High -->

#### **B. Full transcript**
**[00:00] Speaker:** Okay. So thinking about modern HPC architectures, what are features that bring essentially the technology to speed? We see a lot of heterogeneity in the systems. We see accelerators—I talked about GPUs in particular. Often chip designs use memory choices to scale up or integrate different parts of the system together, typically tightly coupled by a higher speed. At a micro-architectural scale, we have superscalar processor cores, out-of-order cores, and different ways of doing parallelism like instruction level and memory parallelism. We have vector units, matrix units, and tensor units. These are the stuff you get in today's HPC or maybe even AI architecture. **[01:30]** We have memory hierarchies multi-level deep in caching and often HBM (High Bandwidth Memory) stack memories to facilitate parallelism. As architectures get more diverse, the picture gets more complex. We will see OpenMP later today. There is a rapid growth of TPUs at Google compared to others. Panelists, please come to the stage.

#### **C. Executive summary**
This lecture explores the hardware foundations of current and future supercomputing, emphasizing the convergence of HPC and AI hardware. The speaker details how modern architectures rely on **heterogeneity** (CPU + GPU/accelerators) and complex memory hierarchies to overcome scaling limits.

#### **D. Problem addressed**
Traditional CPU scaling is no longer sufficient for modern workloads. The explosion of AI-specific needs (like tensor operations) and scientific simulation requirements creates a "divergence" where hardware must satisfy both high-precision math for physics and low-precision throughput for AI.

#### **E. Proposed solution or method**
The use of **accelerators** (GPUs, TPUs) and specialized units (vector/matrix/tensor units) within a single node. The lecture advocates for **Unified Shared Memory (USM)** to simplify programming across CPU and GPU domains, allowing them to see the same address space.

#### **F. Implementation details**
*   **Hardware:** AMD EPYC CPUs, Instinct GPUs (MI300A), and NVIDIA Grace Hopper (GH200) superchips.
*   **Memory:** HBM (High Bandwidth Memory) and 3D SRAM stacks.
*   **Connectivity:** NVLink C2C connectivity for fast CPU-GPU communication.

#### **G. Results and impact**
The transition to GPU-centric systems is rapid; 9 of the top 10 systems are now GPU-based. This shift allows for unprecedented throughput but requires developers to adapt 30 years of CPU-based code to new programming models.

#### **H. Important discussion points**
*   **Vendor Lock-in:** The panel discussed the importance of open standards like **OpenMP** and **SYCL** to ensure portability across different hardware vendors (AMD vs. NVIDIA vs. Intel).
*   **Power Efficiency:** "Power is driving AI." Data centers must be managed as flexible loads on the grid to mitigate environmental impacts.

#### **I. Key terminology**
*   **Heterogeneity:** Systems using different types of processors (e.g., CPUs and GPUs).
*   **Unified Shared Memory (USM):** A memory management technique where the CPU and GPU share an address space, eliminating manual data copies.

#### **J. Conclusions**
Future HPC nodes must balance generality (CPU), vector processing (GPU), and dense algebra (Matrix engines).

#### **K. Open questions or uncertainties**
The exact "optimal balance" between CPU and Matrix compute density is still a subject of active research and quantitative benchmarking.

---

### **Lecture 2: Distributed GPU Computing Tutorial (Parallel Jacobi)**
#### **A. Lecture identification**
*   **Title:** Distributed GPU Computing: Parallel Jacobi Solver
*   **Speaker:** Mathis Bode (JSC)
*   **Date:** June 17, 2026 (4:30 PM Session)
*   **Related PDF:** Workshop GitHub instructions referenced in audio
*   **Related Audio:** `2026-06-17 17-30-43.mp3`, `2026-06-18 16-58-16.mp3`
<!-- *   **Confidence:** High -->

#### **B. Full transcript**
**[00:00] Mathis Bode:** Today we start with introduction to MPI distributed computing on GPUs, followed by a hands-on multi-GPU parallelization using CUDA-aware MPI. Our test case is the **Jacobi solver**. We will utilizing GPUs in clusters, dealing with "ranks." Our system, JUPITER, has four GPUs per node. **[02:00]** MPI is a standard to exchange data between processes. MPI processes have private address spaces. **[04:15]** For domain decomposition, we have three options. One is row stripes. If we divide the domain into stripes, we need to "borrow" data from neighbors using **halo exchanges**. This pattern is optimal for latency-bound communication. Since C uses row-major patterns, continuous data is row-wide, meaning we don't have to deal with complex packing/unpacking for these stripes.

#### **C. Executive summary**
A technical tutorial on scaling a computational kernel (Jacobi solver) across multiple GPUs using the **Message Passing Interface (MPI)**. It focuses on the mechanics of sharing data across distributed memory spaces using CUDA-aware MPI.

#### **D. Problem addressed**
Solving large-scale linear systems (like those in heat diffusion) requires more memory and compute than a single GPU provides. The challenge is the "boundary problem": each GPU needs data from its neighbors' edges to compute its own next step.

#### **E. Proposed solution or method**
**Domain Decomposition** using row stripes. By dividing the grid into horizontal blocks, communication is minimized to only the top and bottom rows (ghost rows).

#### **F. Implementation details**
*   **Programming Model:** MPI + CUDA.
*   **Hardware:** JUPITER nodes (4x NVIDIA GH200 linked via NVLink at 300 GB/s).
*   **Communication:** CUDA-aware MPI allows sending data directly from GPU memory to another GPU's memory via **RDMA** (Remote Direct Memory Access).
*   **Code:** `jakovi.cu` skeleton code requiring implementation of halo exchanges.

#### **G. Results and impact**
Enables the transition from single-node computing to exascale clusters like JUPITER. Mapping one MPI rank to one GPU ensures optimal topology utilization.

#### **H. Important discussion points**
*   **Row-Major vs. Strided Access:** C's row-major storage makes horizontal stripes efficient, whereas vertical columns would require "packing" data because it is not contiguous in memory.
*   **Halo Exchanges:** Participants must handle logic for the "first" and "last" rank to avoid out-of-bounds errors or unnecessary communication.

#### **I. Key terminology**
*   **MPI Rank:** A unique identifier for a process in a parallel job.
*   **Halo Exchange:** The process of swapping boundary data between adjacent computational domains.

#### **J. Conclusions**
Distributed GPU computing requires careful attention to topology and continuous memory access patterns to minimize latency.

---

### **Lecture 3: Inside an LLM - Performance Deep Dive**
#### **A. Lecture identification**
*   **Title:** Inside an LLM: Performance Deep Dive with TinyLlama
*   **Speaker:** Marius Kurz (AMD)
*   **Date:** June 18, 2026 (9:15 AM Session)
*   **Related PDF:** `Kurz_AMD_Tiny_Llama_Heilbronn.pdf`
*   **Related Audio:** `2026-06-18 09-31-28.mp3`
<!-- *   **Confidence:** High -->

#### **B. Full transcript**
**[00:00] Kurz:** Hi everyone, I'm Marius from AMD. I want to talk about performance in standard LLM applications and how it connects to HPC. In HPC, we are used to being "close to metal"—C++, Fortran, manual parallelization. In AI, hardware is often abstracted away via Python. **[03:30]** We will use the **Optimization Loop**: Profile, Prioritize, Implement, Validate. LLM architectures that work well on hardware are the ones people use. If a method is prevalent, we get hardware acceleration like **Tensor Cores**. **[05:00]** A common problem on HPC systems is the file system. Lustre is optimized for few huge files, but AI has millions of small files. This can tear down HPC file systems.

#### **C. Executive summary**
This lecture bridges the gap between high-level AI development and low-level hardware performance. It uses "TinyLlama" (a scaled-down Llama model) to demonstrate how to profile and optimize transformer architectures on GPUs.

#### **D. Problem addressed**
AI developers often treat the GPU as a "black box," leading to inefficient silicon utilization. Transformers have specific bottlenecks, particularly in **Attention mechanisms**, which scale quadratically with sequence length.

#### **E. Proposed solution or method**
The **Optimization Loop**. By profiling code, developers can identify if they are **bandwidth-bound** (moving data) or **compute-bound** (calculating). Key optimization: **Kernel Fusion** (e.g., Flash Attention) to keep data in fast GPU caches longer.

#### **F. Implementation details**
*   **Software:** PyTorch, ROCm (AMD's software stack).
*   **Hardware:** AMD Instinct MI300A GPUs.
*   **Tools:** Timeline traces, Hotspot statistics, and the **Roofline Model**.

#### **G. Results and impact**
The "TinyLlama" approach allows students to understand why Flash Attention is critical: it transforms a bandwidth-heavy operation into a compute-heavy one, significantly improving scaling.

#### **H. Important discussion points**
*   **The "Interactive Gap":** High-level frameworks (Python) create many tiny files during environment setup, which can crash traditional HPC file systems like Lustre.
*   **HPC knowledge transfer:** Skills in memory movement and bandwidth optimization from scientific computing are now vital for frontier AI.

#### **I. Key terminology**
*   **Kernel Fusion:** Combining multiple mathematical operations into a single GPU "kernel" to reduce memory access.
*   **Roofline Model:** A visual tool to determine if an application's performance is limited by peak computation or memory bandwidth.

#### **J. Conclusions**
Understanding hardware metrics (FLOPs, bandwidth) is essential for scaling AI models to trillion-parameter levels.

---

### **Lecture 4: Adaptive Mixed Precision**
#### **A. Lecture identification**
*   **Title:** Right Precision, Right Place: Rethinking HPC with Adaptive Mixed Precision
*   **Speaker:** Hatem Ltaief (KAUST)
*   **Date:** June 18, 2026 (11:15 AM Keynote)
*   **Related PDF:** `ltaief-summerai-mxp.pdf`
*   **Related Audio:** `2026-06-18 14-57-39.mp3`
<!-- *   **Confidence:** High -->

#### **C. Executive summary**
A keynote on leveraging AI hardware's low-precision capabilities (FP8, FP4) to accelerate traditional scientific simulations. The speaker presents "Adaptive Mixed Precision," which uses low precision where it's safe and high precision only where necessary.

#### **D. Problem addressed**
**Data movement** is the primary bottleneck and energy consumer in modern supercomputing. High-precision arithmetic (FP64) is slow and generates massive data volumes.

#### **E. Proposed solution or method**
**Adaptive linear algebra**. The solution involves using mixed-precision Cholesky factorizations and "Microscaling" (MX) formats. These allow for dynamic precision conversion during runtime to maintain numerical reliability while maximizing throughput.

#### **F. Implementation details**
*   **Software:** **Hikma** (linear algebra library) and **Parsec** (runtime system) to manage task dependencies and precision changes.
*   **Formats:** OCP Microscaling (MX) formats including **MXFP8, MXFP6, and MXFP4**.

#### **G. Results and impact**
*   **Speedups:** Over **4,000x** speedup achieved in matrix operations by leveraging specialized AI engines for scientific math.
*   **Climate Modeling:** Enabled exascale climate emulators that earned a **Gordon Bell Prize in 2024**.

#### **H. Important discussion points**
*   **Storage vs. Register:** You can store data in non-compliant "weird" formats (like FP17) to save space, then convert it to a compliant FP32 format once it reaches the registers for computation.
*   **Theory-driven:** Unlike empirical trial-and-error, this approach uses foundational theory to provide an "accuracy budget," telling the algorithm exactly which precision it can afford.

#### **I. Key terminology**
*   **Mixed Precision:** Using multiple numerical formats (e.g., 64-bit and 16-bit) within the same calculation.
*   **Microscaling (MX):** A hardware-supported format that uses a shared scale for a block of elements to reduce footprint while maintaining range. 

---

### **Lecture 5: Exascale Applications - ICON & NekCRF**
#### **A. Lecture identification**
*   **Title:** ICON (Climate) & NekCRF (Combustion) at Exascale
*   **Speakers:** Jan Frederik Engels (DKRZ) and Hendrik Nicolai (McGill)
*   **Date:** June 19, 2026 (Afternoon Session)
*   **Related PDF:** `JFE_ICON.pdf`, `Nicolai_Heilbronn_HPC-AI.pdf`
*   **Related Audio:** `2026-06-19 14-04-33.mp3`, `2026-06-19 16-08-50.mp3`
<!-- *   **Confidence:** High -->

#### **C. Executive summary**
This session highlights how exascale systems like **JUPITER** and **Frontier** enable "Digital Twins" of the Earth and high-fidelity combustion simulations. These projects push the limits of resolution (1km for Earth) and multi-physics complexity.

#### **D. Problem addressed**
*   **Climate:** Traditional models use "parameterization" to guess processes like cloud formation because the grid is too coarse. This is inaccurate.
*   **Combustion:** Hydrogen flames are highly turbulent and reactive, requiring "Direct Numerical Simulation" (DNS) that is too expensive for pre-exascale systems.

#### **E. Proposed solution or method**
*   **ICON:** Using the **DaCe** (Data-Centric) framework to achieve performance portability, allowing the code to run efficiently on both NVIDIA and AMD GPUs without multiple rewrites.
*   **NekCRF:** A spectral element code that uses **operator splitting** to separate chemistry from flow physics, allowing for massive parallelization on GPUs.

#### **F. Implementation details**
*   **Software:** MPI, OpenMP, and **OpenACC**.
*   **Balancing:** Careful load balancing is required because if the atmosphere component is too fast, the expensive GPUs sit idle while waiting for the slower ocean component.

#### **G. Results and impact**
*   **ICON:** Won the Gordon Bell Prize for simulating the Full Earth System at **1km resolution**.
*   **NekCRF:** Reduced CFD compute time by **3.5x** and energy by **15x** compared to CPU-only runs. [Slide data summary]

#### **J. Conclusions for Students**
HPC provides the bedrock (math, interconnects) that makes AI possible, while AI provides the "shortcuts" (surrogate models) that make exascale science affordable. Portability (SYCL, OpenMP) is the only way to ensure scientific code survives the rapidly shifting hardware landscape.