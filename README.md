# Welcome to SimPatico: Simulation Tool for the Analysis of TDOA
Simulation PlAtform for PosiTIon LoCatiOn evaluation (SimPatico) contains a variety of TDOA methods, including angle of arrival (AoA) and robust algorithms that are not scope of this work. There are also degradation models for gaussian and non-gaussian channels such as GMM and alpha-stable processes. It is possible to evaluate synthetic and real data.

Simulator outcomes are produced in terms of performance metrics of the direction of arrival (DoA) algorithms and they are saved in data files and plots.

## Features
- Several AoA (Angle-of-Arrival) and TDOA (Time Difference Of Arrival) algorithms.
- Robust algorithms for impulsive noise.
- Functions to generate Gaussian and non-Gaussian channels.
- Functions to compute performance metrics of DOA (Direction Of Arrival) algorithms.
- Functions to save the results and plots.
- Several useful utility functions.

## Citation
If you use SimPatico, please cite our IPIN paper for TDOA purposes (**The module for TDOA will be made publicly available after that we have received the acceptance of this publication.**) and our Brazilian Journals Publicações paper for DOA purposes (**The module for DOA will be made publicly available after that we have received the acceptance of this publication.**). Here is a suitable BibTeX entry:

```python
@inproceedings{andre2021,
  title = {{A Simulation Tool for the Analysis of TDOA Methods}},
  author = {André B. de F. Diniz and Danilo S. Pena and Vicente A. de Sousa Jr.}
  booktitle = {11th International Conference On Indoor Positioning And Indoor Navigation, IPIN 2021},
  year = {2021}
}
```

```python
@inproceedings{mario2020,
  title = {{Análise de Desempenho de Métodos de DOA sujeitos a Modelos de Ruído Impulsivo com Misturas Gaussinas}},
  author = {Mário G. F. Figueredo, Danilo de S. Pena, Carlos A. de Lima Filho, Matheus F. de S. Dória, Allan de M. Martins, Vicente A. de Sousa Jr.}
  booktitle = {Brazilian Journals Publicações},
  url={https://doi.org/10.35587/brj.ed.0000606}
  year = {2020}
}
```

## Academic works
- Book chapter: Análise de Desempenho de Métodos de DOA sujeitos a Modelos de Ruído Impulsivo com Misturas Gaussinas, to appear in Brazilian Journals Publicações (DOI: [https://doi.org/10.35587/brj.ed.0000606](https://doi.org/10.35587/brj.ed.0000606));
- Paper: Robust time delay estimation based on non-Gaussian impulsive acoustic channel, in JOURNAL OF COMMUNICATION AND INFORMATION SYSTEMS (DOI: [https://doi.org/10.14209/jcis.2020.9](https://doi.org/10.14209/jcis.2020.9));
- PhD Dissertation: DANILO DE SANTANA PENA, Localização baseada em Sinais Acústicos sujeitos a Ruído Impulsivo (2019) - Federal University of Rio Grande do Norte;
- Master Thesis: MÁRIO GUILHERME FLORES FIGUEREDO, Desempenho de algoritmos de localização de sinais de áudio sujeitos a ruído impulsivo  (2019) - Federal University of Rio Grande do Norte; 

## People
- Danilo Pena (main developer)
- Daniel Flor (contributor)
- André Diniz (contributor)
- Mario Figueredo (contributor)
- Vicente Sousa (advisor)
- Allan Medeiros (advisor)

## License
SimPatico is released under the MIT license.

## Acknowledgments
Danilo Pena would like to thank Prof. Dr. Yuri Catunda for the resource support.
